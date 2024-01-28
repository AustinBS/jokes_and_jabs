/// @description Insert description here
// You can write your code in this editor
enum CharacterState 
{
    Idle,
    Walking,
    Attacking,
    Hurt,
	Dead
}

currState = CharacterState.Idle;

move_speed = 4;

vel_x = 0;
vel_y = 0;

grounded = false;
attacking = false;
light = false;
medium = false;
heavy = false;
spc1 = false;
spc2 = false;
spc3 = false;

max_hp = 100;
hp = max_hp;

// This variable is used to grant the player invincibility, after it's hit by an enemy or after it falls off ground.
// It stores the remaining number of frames where the player can't be hurt. If it's 0, it means the player is not invincible.
no_hurt_frames = 0;
