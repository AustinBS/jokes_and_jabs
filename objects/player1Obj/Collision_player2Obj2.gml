/// @description Insert description here
// You can write your code in this editor
if (no_hurt_frames > 0)
{
	// In that case we exit the event so the player is not hurt by the enemy.
	exit;
}
if (player2Obj2.attacking) {
	if(player2Obj2.light) {
		player1Obj.hp -= 10;
	} else if (player2Obj2.medium) {
		player1Obj.hp -= 15;
	} else if (player2Obj2.heavy) {
		player1Obj.hp -= 20;
	} else if (player2Obj2.spc1) {
		player1Obj.hp -= 30;
	} else if (player2Obj2.spc2) {
		player1Obj.hp -= 12;
	} else if (player2Obj2.spc3) {
		player1Obj.hp -= 5;
	}
	no_hurt_frames += 90;
}
