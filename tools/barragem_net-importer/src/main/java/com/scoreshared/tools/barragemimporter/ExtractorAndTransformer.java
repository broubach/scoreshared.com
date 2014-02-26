package com.scoreshared.tools.barragemimporter;

import java.util.Collection;
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
import net.barragem.persistence.entity.TipoBackhandEnum;
import net.barragem.persistence.entity.Usuario;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.hibernate.Query;
import org.hibernate.Session;

import com.scoreshared.domain.entity.ApprovalResponseEnum;
import com.scoreshared.domain.entity.BackhandTypeEnum;
import com.scoreshared.domain.entity.File;
import com.scoreshared.domain.entity.Invitation;
import com.scoreshared.domain.entity.InvitationResponseEnum;
import com.scoreshared.domain.entity.Player;
import com.scoreshared.domain.entity.PlayerInstance;
import com.scoreshared.domain.entity.PlayerInstanceComment;
import com.scoreshared.domain.entity.Profile;
import com.scoreshared.domain.entity.Score;
import com.scoreshared.domain.entity.SportEnum;
import com.scoreshared.domain.entity.User;

public class ExtractorAndTransformer {
    private Map<Integer, User> userByUsuarioIdMap = new HashMap<Integer, User>();
    private Map<Integer, Player> playerByJogadorIdMap = new HashMap<Integer, Player>();
    private Set<Score> scoresCreated = new HashSet<Score>();
    private Set<PlayerInstanceComment> commentsCreated = new HashSet<PlayerInstanceComment>();
    private Map<String, Object> context;
    private Map<Pair<Integer, Integer>, Player> playerByAssociationAndOwnerPairs = new HashMap<Pair<Integer, Integer>, Player>();
    private Set<Player> playersCreated = new HashSet<Player>();

    public void execute(Map<String, Object> context, Session scoresharedSession, Session barragemSession) {
        this.context = context;

        Query query = (Query) barragemSession.createQuery("from Usuario");
        List<Usuario> usuarios = query.list();
        transformUserProfileAndFile(usuarios);

        query = (Query) barragemSession.createQuery("from Jogador");
        List<Jogador> jogadores = query.list();
        transformPlayers(jogadores);

        query = (Query) barragemSession.createQuery("from Evento");
        List<? extends Evento> eventos = query.list();
        transformScores(eventos);
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
        user.setPassword(usuario.getSenha());
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
            profile.setCoachName(perfil.getProfessorNome());
            profile.setDateStartedPlaying(perfil.getDataInicioPratica());
            if (perfil.getLadoForehand() != null) {
                profile.setLeftHanded(LadoForehandEnum.Esquerdo.equals(perfil.getLadoForehand()) ? Boolean.TRUE
                        : Boolean.FALSE);
            }
            if (perfil.getLadoForehand() != null) {
                profile.setBackhandType(TipoBackhandEnum.UmaMao.equals(perfil.getTipoBackhand()) ? BackhandTypeEnum.ONE_HANDED : BackhandTypeEnum.TWO_HANDED);
            }
            profile.setRacquet(perfil.getRaquete());
            profile.setTwitterAccount(perfil.getUsuarioTwitter());
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
        for (Jogador jogador : jogadores) {
            Player player = transformPlayer(jogador);
            Pair<Integer, Integer> pair = new MutablePair<Integer, Integer>(player.getAssociation() != null ? player
                    .getAssociation().hashCode() : null, player.getOwner().hashCode());
            playerByAssociationAndOwnerPairs.put(pair, player);
            playerByJogadorIdMap.put(jogador.getId(), player);
        }
        transformBidirectionalPlayers(playerByJogadorIdMap.values());
    }

    private Player transformPlayer(Jogador jogador) {
        Player player = new Player(jogador.getNome(), userByUsuarioIdMap.get(jogador.getUsuarioDono().getId()));
        if (jogador.getUsuarioCorrespondente() != null) {
            Invitation invitation = new Invitation();
            invitation.setResponse(InvitationResponseEnum.ACCEPTED);
            invitation.setDate(new Date());
            player.setInvitation(invitation);

            if (jogador.getUsuarioDono().getId().equals(jogador.getUsuarioCorrespondente().getId())) {
                player.setAssociation(player.getOwner());
            } else {
                player.setAssociation(userByUsuarioIdMap.get(jogador.getUsuarioCorrespondente().getId()));
            }
        }
        return player;
    }

    private void transformBidirectionalPlayers(Collection<Player> players) {
        for (Player player : players) {
            if (player.getAssociation() != null) {
                Pair<Integer, Integer> pair = new MutablePair<Integer, Integer>(player.getOwner().hashCode(),
                        player.getAssociation().hashCode());
                if (playerByAssociationAndOwnerPairs.get(pair) == null) {
                    Player bidirectionalEdge = new Player(player.getOwner().getFullName(), player.getAssociation());
                    bidirectionalEdge.setAssociation(player.getOwner());
                    bidirectionalEdge.setInvitation(new Invitation());
                    bidirectionalEdge.getInvitation().setDate(new Date());
                    bidirectionalEdge.getInvitation().setResponse(InvitationResponseEnum.ACCEPTED);
                    playerByAssociationAndOwnerPairs.put(pair, bidirectionalEdge);
                }
            }
        }
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
        if ((evento instanceof Jogo) && (Boolean.TRUE.equals(((Jogo) evento).getPlacar().getWo()) || ((Jogo) evento).getPlacar().getParciais().isEmpty())) {
            return null;
        }
        Score score = new Score();
        context.put("currentScore", score);
        score.setOwner(userByUsuarioIdMap.get(evento.getUsuarioResponsavel().getId()));
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
        if (!hasOwnerListedAsPlayer(score)) {
            if (!forwardScoreToAssociatedPlayer(score)) {
                commentsCreated.remove(context.get("lastCommentCreated"));
                return null;
            }
        }
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
        score.setConfirmed(isPlayerInstanceConnected(score.getLeftPlayers())
                && isPlayerInstanceConnected(score.getRightPlayers()));
        return score;
    }

    private boolean isPlayerInstanceConnected(Set<PlayerInstance> playerInstances) {
        for (PlayerInstance playerInstance : playerInstances) {
            if (playerInstance.isScoreConnected()) {
                return true;
            }
        }
        return false;
    }

    private boolean forwardScoreToAssociatedPlayer(Score score) {
        User newOwner = extractNewOwner(score.getLeftPlayers());
        if (newOwner == null) {
            newOwner = extractNewOwner(score.getRightPlayers());
            if (newOwner == null) {
                return false;
            }
        }
        for (PlayerInstance playerInstance : score.getAllPlayers()) {
            Player playerReplacement = null;
            if (playerInstance.getAssociation() != null) {
                Pair<Integer, Integer> pair = new MutablePair<Integer, Integer>(playerInstance.getAssociation().hashCode(), newOwner.hashCode());
                playerReplacement = playerByAssociationAndOwnerPairs.get(pair);
            }
            if (playerReplacement == null) {
                playerReplacement = new Player(playerInstance.getPlayer().getName(), newOwner);
                playersCreated.add(playerReplacement);
            }
            playerInstance.setPlayer(playerReplacement);
        }
        score.setOwner(newOwner);
        return true;
    }

    private User extractNewOwner(Set<PlayerInstance> players) {
        for (PlayerInstance playerInstance : players) {
            if (playerInstance.getAssociation() != null && playerInstance.getOwner() != playerInstance.getAssociation()) {
                return playerInstance.getAssociation();
            }
        }
        return null;
    }

    private boolean hasOwnerListedAsPlayer(Score score) {
        for (PlayerInstance playerInstance : score.getAllPlayers()) {
           if (playerInstance.isScoreConnected() && playerInstance.getAssociation() == score.getOwner()) {
               return true;
           } 
        }
        return false;
    }

    private Set<PlayerInstance>[] transformPlayerInstancesFromJogo(List<JogadorEvento> jogadoresEventos) {
        Set<PlayerInstance> leftPlayers = new HashSet<PlayerInstance>();
        Set<PlayerInstance> rightPlayers = new HashSet<PlayerInstance>();
        for (JogadorEvento jogadorEvento : jogadoresEventos) {
            Object[] playerInstanceAndComment = transformPlayerInstance((JogadorJogo) jogadorEvento);
            PlayerInstance playerInstance = (PlayerInstance) playerInstanceAndComment[0];
            if (playerInstanceAndComment[1] != null) {
                context.put("lastCommentCreated", playerInstanceAndComment[1]);
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
        for (JogadorEvento jogadorEvento : jogadoresEventos) {
            Object[] playerInstanceAndComment = transformPlayerInstance(jogadorEvento);
            PlayerInstance playerInstance = (PlayerInstance) playerInstanceAndComment[0];
            if (playerInstanceAndComment[1] != null) {
                commentsCreated.add((PlayerInstanceComment) playerInstanceAndComment[1]);
            }

            Score score = (Score) context.get("currentScore");
            if (score.getOwner() == playerInstance.getAssociation()) {
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
        if (playerInstance.getPlayer().isConnected()) {
            playerInstance.setApprovalResponse(ApprovalResponseEnum.ACCEPTED);
        }
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

    public Set<User> getUsers() {
        return new HashSet<User>(userByUsuarioIdMap.values());
    }

    public Set<Player> getPlayers() {
        Set<Player> players = new HashSet<Player>(playerByAssociationAndOwnerPairs.values());
        players.addAll(playersCreated);
        return players;
    }

    public Set<Score> getScores() {
        return scoresCreated;
    }

    public Set<PlayerInstanceComment> getComments() {
        return commentsCreated;
    }
}
