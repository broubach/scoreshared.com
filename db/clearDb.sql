delete from score_player_left;
delete from score_player_right;
delete from score;
delete from comment;
delete from player;
update user set profile_id = null;
delete from profile;
update file set owner_Id = null;
delete from file where id <> 7 and id<> 4;
delete from user;