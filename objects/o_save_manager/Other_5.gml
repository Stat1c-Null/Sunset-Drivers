var _current_challenge = gxc_get_query_param("challenge");

if (global.money_highscore < global.money_score) {
	global.money_highscore = global.money_score
	if (_current_challenge == global.ch_banker and global.gameover == true)
	{
		gxc_challenge_submit_score(global.money_highscore);
	}
}

save()