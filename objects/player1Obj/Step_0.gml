/// @description Insert description here
// You can write your code in this editor
switch (currState) 
{
    case CharacterState.Idle:
        sprite_index = plyrSprAlt;
        // Check for input to transition to other states (e.g., walking or attacking)
        if ((keyboard_check(vk_right) or keyboard_check(vk_left))) {
			currState = CharacterState.Walking;
		}
        else if (keyboard_check(ord("L")) or keyboard_check(ord("K")) or keyboard_check(ord("J"))) {
			currState = CharacterState.Attacking;
		}
		else break;
    case CharacterState.Walking:
        vel_x = keyboard_check(vk_right) - keyboard_check(vk_left);
		if (vel_x < 0) {
			sprite_index = walkSprAlt;
		} else {
			sprite_index = backSprAlt;
		}
		vel_x *= move_speed;
		
        // Check for input to transition to other states (e.g., idle or attacking)
        if (keyboard_check(!vk_right) or keyboard_check(!vk_left)) {
			currState = CharacterState.Idle;
		}
        if (keyboard_check(ord("L")) or keyboard_check(ord("K")) or keyboard_check(ord("J"))) {
			currState = CharacterState.Attacking;
		}
        break;

    case CharacterState.Attacking:
		attacking = true;
		vel_x = 0;
		if (keyboard_check(ord("L"))) {
			light = true;
			sprite_index = lightAtkAlt;
		}
		else if (keyboard_check(ord("K"))) {
			medium = true;
			sprite_index = mediumAtkAlt;
		}
		else if (keyboard_check(ord("J"))) {
			heavy = true;
			sprite_index = heavyAtkAlt;
		}
		else if (keyboard_check(vk_rshift) and keyboard_check(ord("L"))) {
			spc1 = true;
			sprite_index = mediumAtkAlt;
		}
		else if (keyboard_check(vk_rshift) and keyboard_check(ord("K"))) {
			spc2 = true;
			sprite_index = mediumAtkAlt;
		}
		else if (keyboard_check(vk_rshift) and keyboard_check(ord("J"))) {
			spc3 = true;
			sprite_index = heavyAtkAlt;
		}
		
		//leaving the attacking state is handled in the animation end event
        break;
		
	case CharacterState.Dead:
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
