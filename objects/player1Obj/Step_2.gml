/// @description Insert description here
// You can write your code in this editor

if (no_hurt_frames > 0)
{
	// In that case we reduce the variable by 1, as one frame as passed. Eventually it will reach 0 again and the character will be able
	// to be hurt.
	no_hurt_frames -= 1;

	// This part handles making the character flash on and off when it's invincible, by changing its alpha between 0 and 1.
	// If the remainder of no_hurt_frames divided by 12 is above 6, we'll set the alpha to 0.
	// Otherwise we'll set it to 1.
	if (no_hurt_frames % 12 > 6)
	{
		// This makes the character invisible.
		image_alpha = 0;
	}
	else
	{
		// This makes the character visible again.
		image_alpha = 1;
	}
}

if (player1Obj.hp <= 0) {
	image_alpha = 0;
	currState = CharacterState.Dead;
	room_goto(plyr1Win);
}