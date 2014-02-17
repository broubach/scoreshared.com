package com.scoreshared.tools.barragemimporter;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.barragem.persistence.entity.Arquivo;
import net.barragem.persistence.entity.Evento;
import net.barragem.persistence.entity.Jogador;
import net.barragem.persistence.entity.JogadorEvento;
import net.barragem.persistence.entity.JogadorJogo;
import net.barragem.persistence.entity.Jogo;
import net.barragem.persistence.entity.LadoForehandEnum;
import net.barragem.persistence.entity.Parcial;
import net.barragem.persistence.entity.Perfil;
import net.barragem.persistence.entity.SexoEnum;
import net.barragem.persistence.entity.Usuario;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.scoreshared.business.persistence.File;
import com.scoreshared.business.persistence.Invitation;
import com.scoreshared.business.persistence.InvitationResponseEnum;
import com.scoreshared.business.persistence.Player;
import com.scoreshared.business.persistence.PlayerInstance;
import com.scoreshared.business.persistence.PlayerInstanceComment;
import com.scoreshared.business.persistence.Profile;
import com.scoreshared.business.persistence.Score;
import com.scoreshared.business.persistence.SportEnum;
import com.scoreshared.business.persistence.User;

public class BarragemImporter {
    Logger logger = Logger.getLogger(BarragemImporter.class);
    
    private Map<Integer, User> userByUsuarioIdMap = new HashMap<Integer, User>();
    private Map<Integer, Player> playerByJogadorIdMap = new HashMap<Integer, Player>();
    private Map<String, Object> context = new HashMap<String, Object>();
    private Set<Score> scoresCreated = new HashSet<Score>();
    private Set<PlayerInstanceComment> commentsCreated = new HashSet<PlayerInstanceComment>();

    public static void main(String args[]) {
        Session barragemSession = null;
        Session scoresharedSession = null;
        Transaction t = null;
        try {
            SessionFactory barragemSessionFactory = new Configuration().configure("barragem-hib.cfg.xml")
                    .buildSessionFactory();
            barragemSession = barragemSessionFactory.openSession();

            SessionFactory scoresharedSessionFactory = new Configuration().configure("scoreshared-hib.cfg.xml")
                    .buildSessionFactory();
            scoresharedSession = scoresharedSessionFactory.openSession();
            t = scoresharedSession.beginTransaction();

            BarragemImporter importer = new BarragemImporter();
            importer.executeETL(scoresharedSession, barragemSession);
            t.commit();
            System.exit(0);
        } catch (HibernateException e) {
            if (t != null) {
                t.rollback();
            }

        } finally {
            if (barragemSession != null) {
                barragemSession.close();
            }
            if (scoresharedSession != null) {
                scoresharedSession.close();
            }
        }
    }

    private void executeETL(Session scoresharedSession, Session barragemSession) {
        Query query = (Query) barragemSession.createQuery("from Usuario");
        List<Usuario> usuarios = query.list();
        transformUserProfileAndFile(usuarios);

        query = (Query) barragemSession.createQuery("from Jogador");
        List<Jogador> jogadores = query.list();
        transformPlayers(jogadores);

        query = (Query) barragemSession.createQuery("from Evento");
        List<? extends Evento> eventos = query.list();
        transformScores(eventos);

        logger.info("Users about to import: " + userByUsuarioIdMap.values().size());
        for (User user : userByUsuarioIdMap.values()) {
            scoresharedSession.save(user);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + userByUsuarioIdMap.values().size());

        logger.info("Players about to import: " + playerByJogadorIdMap.values().size());
        for (Player player : playerByJogadorIdMap.values()) {
            scoresharedSession.saveOrUpdate(player);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + playerByJogadorIdMap.values().size());

        logger.info("Scores about to import: " + scoresCreated.size());
        for (Score score : scoresCreated) {
            scoresharedSession.save(score);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + scoresCreated.size());

        logger.info("Comments about to import: " + scoresCreated.size());
        for (PlayerInstanceComment comments : commentsCreated) {
            scoresharedSession.save(comments);
        }
        scoresharedSession.flush();
        logger.info("Imported: " + commentsCreated.size());
    }

    private void transformUserProfileAndFile(List<Usuario> usuarios) {
        for (Usuario usuario : usuarios) {
            User user = transformUser(usuario);
            context.put("currentUser", user);
            user.setProfile(transformProfile(usuario.getPerfil()));

            userByUsuarioIdMap.put(usuario.getId(), user);
        }
    }

    private User transformUser(Usuario usuario) {
        User user = new User();
        user.setFirstName(usuario.getNome());
        user.setLastName(usuario.getSobrenome());
        user.setEmail(usuario.getEmail());
        user.setBirthday(usuario.getAniversario());
        user.setGender(SexoEnum.Homem.equals(usuario.getSexo()) ? 'M' : 'F');
        user.setLastAccess(usuario.getDataUltimoAcesso());
        user.setBeforeLastAccess(usuario.getDataPenultimoAcesso());
        return user;
    }

    private Profile transformProfile(Perfil perfil) {
        Profile profile = null; 
        if (perfil != null) {
            profile = new Profile();
            profile.setAcademy(perfil.getClubeMaisFrequentadoNome());
            profile.setCity(perfil.getClubeMaisFrequentadoCidade());
            profile.setCity(perfil.getProfessorNome());
            // professorNome -> (new Player)
            // dataInicioPratica -> ???
            if (perfil.getLadoForehand() != null) {
                profile.setLeftHanded(LadoForehandEnum.Esquerdo.equals(perfil.getLadoForehand()) ? Boolean.TRUE
                        : Boolean.FALSE);
            }
            // tipoBackhand -> ???
            // professor -> ???
            // raquete -> ???
            // usuarioTwitter -> ???
            profile.setSport(SportEnum.TENNIS);
            profile.setShowContactInfoToFriends(Boolean.FALSE);
            profile.setSignupProcessCompleted(Boolean.TRUE);
            if (perfil.getHash() != null) {
                profile.setAvatarHash(perfil.getHash());
                Arquivo foto = null;
                if (perfil.getFotoPequena() != null) {
                    foto = perfil.getFotoPequena();
                    profile.setSmallAvatar(transformFile(foto));
                }
                if (perfil.getFoto() != null) {
                    foto = perfil.getFoto();
                    profile.setAvatar(transformFile(foto));
                }
            }
        }
        return profile;
    }

    private File transformFile(Arquivo foto) {
        File smallAvatar = new File();
        smallAvatar.setData(foto.getDado());
        smallAvatar.setName(foto.getNome());
        smallAvatar.setSize(Long.valueOf(foto.getTamanho()));
        smallAvatar.setDate(foto.getData());
        smallAvatar.setMime(foto.getMime());
        smallAvatar.setOwner((User) context.get("currentUser"));
        return smallAvatar;
    }

    private void transformPlayers(List<Jogador> jogadores) {
        Set<Integer> ownerIds = new HashSet<Integer>();
        for (Jogador jogador : jogadores) {
            Player player = transformPlayer(jogador);
            if (player.getAssociation() != null && ownerIds.add(player.getAssociation().getId())) {
                playerByJogadorIdMap.put(jogador.getId(), player);
            }
        }
    }

    private Player transformPlayer(Jogador jogador) {
        Player player = new Player(jogador.getNome(), userByUsuarioIdMap.get(jogador.getUsuarioDono().getId()));
        if (jogador.getUsuarioCorrespondente() != null && jogador.getUsuarioDono().getId().equals(jogador.getUsuarioCorrespondente().getId())) {
            player.setAssociation(player.getOwner());
            Invitation invitation = new Invitation();
            invitation.setResponse(InvitationResponseEnum.ACCEPTED);
            invitation.setDate(new Date());
            player.setInvitation(invitation);
        }
        return player;
    }

    private void transformScores(List<? extends Evento> eventos) {
        Score score = null;
        for (Evento evento : eventos) {
            score = transformScore(evento);
            if (score != null) {
                scoresCreated.add(score);
            }
        }
    }

    private Score transformScore(Evento evento) {
        if (evento.getData() == null) {
            return null;
        }
        Score score = new Score();
        context.put("currentScore", score);
        Set<PlayerInstance>[] playerInstances = null;
        if (evento instanceof Jogo) {
            playerInstances = transformPlayerInstancesFromJogo(evento.getJogadoresEventos());
        } else {
            playerInstances = transformPlayerInstancesFromEvento(evento.getJogadoresEventos());
        }
        score.setLeftPlayers(playerInstances[0]);
        score.setRightPlayers(playerInstances[1]);
        score.setDate(evento.getData());
        score.setTime(evento.getHora());
        score.setOwner(userByUsuarioIdMap.get(evento.getUsuarioResponsavel().getId()));
        score.setSport(SportEnum.TENNIS);
        if (evento instanceof Jogo) {
            Parcial parcial = null;
            for (int i = 0; i < ((Jogo) evento).getPlacar().getParciais().size() && i < 5; i++) {
                parcial = ((Jogo) evento).getPlacar().getParciais().get(i);
                Integer setLeft = parcial.getParcialVencedor();
                Integer setRight = parcial.getParcialPerdedor();
                if (i == 0) {
                    score.setSet1Left(setLeft);
                    score.setSet1Right(setRight);

                } else if (i == 1) {
                    score.setSet2Left(setLeft);
                    score.setSet2Right(setRight);

                } else if (i == 2) {
                    score.setSet3Left(setLeft);
                    score.setSet3Right(setRight);

                } else if (i == 3) {
                    score.setSet4Left(setLeft);
                    score.setSet4Right(setRight);

                } else if (i == 4) {
                    score.setSet5Left(setLeft);
                    score.setSet5Right(setRight);
                }
            }
        }
        return score;
    }

    private Set<PlayerInstance>[] transformPlayerInstancesFromJogo(List<JogadorEvento> jogadoresEventos) {
        Set<PlayerInstance> leftPlayers = new HashSet<PlayerInstance>();
        Set<PlayerInstance> rightPlayers = new HashSet<PlayerInstance>();
        for (JogadorEvento jogadorEvento : jogadoresEventos) {
            Object[] playerInstanceAndComment = transformPlayerInstance((JogadorJogo) jogadorEvento);
            PlayerInstance playerInstance = (PlayerInstance) playerInstanceAndComment[0];
            if (playerInstanceAndComment[1] != null) {
                commentsCreated.add((PlayerInstanceComment) playerInstanceAndComment[1]);
            }
            
            if (playerInstance.getScoreLeft() != null) {
                leftPlayers.add(playerInstance);
            } else {
                rightPlayers.add(playerInstance);
            }
        }
        return new Set[] { leftPlayers, rightPlayers };
    }

    private Set<PlayerInstance>[] transformPlayerInstancesFromEvento(List<JogadorEvento> jogadoresEventos) {
        Set<PlayerInstance> leftPlayers = new HashSet<PlayerInstance>();
        Set<PlayerInstance> rightPlayers = new HashSet<PlayerInstance>();
        JogadorEvento jogadorEvento = null;
        for (int i = 0; i < jogadoresEventos.size(); i++) {
            jogadorEvento = jogadoresEventos.get(i);
            Object[] playerInstanceAndComment = transformPlayerInstance(jogadorEvento);
            PlayerInstance playerInstance = (PlayerInstance) playerInstanceAndComment[0];
            if (playerInstanceAndComment[1] != null) {
                commentsCreated.add((PlayerInstanceComment) playerInstanceAndComment[1]);
            }

            Score score = (Score) context.get("currentScore");
            if ((i % 2) == 0) {
                playerInstance.setScoreLeft(score);
                leftPlayers.add(playerInstance);

            } else {
                playerInstance.setScoreRight(score);
                rightPlayers.add(playerInstance);
                
            }
        }
        return new Set[] { leftPlayers, rightPlayers };
    }

    private Object[] transformPlayerInstance(JogadorEvento jogadorEvento) {
        PlayerInstance playerInstance = new PlayerInstance();
        playerInstance.setPlayer(playerByJogadorIdMap.get(jogadorEvento.getJogador().getId()));
        PlayerInstanceComment comment = null;
        if (!StringUtils.isEmpty(jogadorEvento.getComentario())) {
            comment = new PlayerInstanceComment();
            comment.setComment(jogadorEvento.getComentario());
            comment.setOwner(userByUsuarioIdMap.get(jogadorEvento.getEvento().getUsuarioResponsavel().getId()));
            comment.setPlayerInstance(playerInstance);
        }
        return new Object[] { playerInstance, comment };
    }

    private Object[] transformPlayerInstance(JogadorJogo jogadorJogo) {
        Object[] playerInstanceAndComment = transformPlayerInstance((JogadorEvento) jogadorJogo);
        PlayerInstance playerInstance = (PlayerInstance) playerInstanceAndComment[0];
        Score score = (Score) context.get("currentScore");
        playerInstance.setScoreLeft(Boolean.TRUE.equals(jogadorJogo.getVencedor()) ? score : null);
        playerInstance.setScoreRight(Boolean.FALSE.equals(jogadorJogo.getVencedor()) ? score : null);
        return playerInstanceAndComment;
    }
}