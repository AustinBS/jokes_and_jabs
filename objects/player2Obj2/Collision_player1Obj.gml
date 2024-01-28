/// @description Insert description here
// You can write your code in this editor
if (no_hurt_frames > 0)
{
	// In that case we exit the event so the player is not hurt by the enemy.
	exit;
}
if (player1Obj.attacking) {
	if(player1Obj.light) {
		player2Obj2.hp -= 10;
	} else if (player1Obj.medium) {
		player2Obj2.hp -= 15;
	} else if (player1Obj.heavy) {
		player2Obj2.hp -= 20;
	} else if (player1Obj.spc1) {
		player2Obj2.hp -= 30;
	} else if (player1Obj.spc2) {
		player2Obj2.hp -= 12;
	} else if (player1Obj.spc3) {
		player2Obj2.hp -= 5;
	}
	no_hurt_frames += 90;
}

