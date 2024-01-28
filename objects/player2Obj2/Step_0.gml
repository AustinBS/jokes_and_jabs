/// @description Insert description here
// You can write your code in this editor
switch (currState) 
{
    case Character2State.Idle:
        sprite_index = plyrSpr;
        // Check for input to transition to other states (e.g., walking or attacking)
        if ((keyboard_check(ord("D"))) or (keyboard_check(ord("A")))) {
			currState = Character2State.Walking;
		}
        if (keyboard_check(ord("Z")) or keyboard_check(ord("X")) or keyboard_check(ord("C"))) {
			currState = Character2State.Attacking;
		}
		else break;
    case Character2State.Walking:
        vel_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
		if (vel_x > 0) {
			sprite_index = walkSpr;
		} else {
			sprite_index = backSpr;
		}
		vel_x *= move_speed;
		
        // Check for input to transition to other states (e.g., idle or attacking)
        if (keyboard_check(!ord("D")) or keyboard_check(!ord("A"))) {
			currState = Character2State.Idle;
		}
        if (keyboard_check(ord("Z")) or keyboard_check(ord("X")) or keyboard_check(ord("C"))) {
			currState = Character2State.Attacking;
		}
        break;

    case Character2State.Attacking:
		attacking = true;		
		vel_x = 0;
		if (keyboard_check(ord("Z"))) {
			light = true;
			sprite_index = lightAtk;
		}
		else if (keyboard_check(ord("X"))) {
			medium = true;
			sprite_index = mediumAtk;
		}
		else if (keyboard_check(ord("C"))) {
			heavy = true;
			sprite_index = heavyAtk;
		}
		else if (keyboard_check(vk_rshift) and keyboard_check(ord("Z"))) {
			spc1 = true;
			sprite_index = mediumAtk;
		}
		else if (keyboard_check(vk_rshift) and keyboard_check(ord("X"))) {
			spc2 = true;
			sprite_index = mediumAtk;
		}
		else if (keyboard_check(vk_rshift) and keyboard_check(ord("C"))) {
			spc3 = true;
			sprite_index = heavyAtk;
		}
		//leaving the attacking state is handled in the animation end event
        break;
		
	case Character2State.Dead:
		break;
}

if (place_meeting(x + vel_x + 1, y, wallLObj))
{
	vel_x = 0;
}

if (place_meeting(x + vel_x - 1, y, wallRObj))
{
	vel_x = 0;
}

move_and_collide(vel_x, vel_y, groundObj);
