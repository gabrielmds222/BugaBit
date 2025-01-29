/// @description 

var horizontal_input = keyboard_check(key_right) - keyboard_check(key_left);

if(horizontal_input != 0) {
	horizontal_speed += accel * horizontal_input;
	horizontal_speed = clamp(horizontal_speed, -max_speed, max_speed);
} else {
	if(horizontal_speed > decel) {
		horizontal_speed -= decel;
	} else if(horizontal_speed < -decel) {
		horizontal_speed += decel;
	} else {
		horizontal_speed = 0;
	}
}

if(place_meeting(x + horizontal_speed, y, obj_solid)) {
	while(! place_meeting(x + sign(horizontal_speed), y, obj_solid)) {
		x += sign(horizontal_speed);
	}
	
	horizontal_speed = 0;

}

x += horizontal_speed;

var vertical_input = keyboard_check(key_down) - keyboard_check(key_up);

if(vertical_input != 0) {
	vertical_speed += accel * vertical_input;
	vertical_speed = clamp(vertical_speed, -max_speed, max_speed);
} else {
	if(vertical_speed > decel) {
		vertical_speed -= decel;
	} else if(vertical_speed < -decel) {
		vertical_speed += decel;
	} else {
		vertical_speed = 0;
	}
}

if(place_meeting(x, y + vertical_speed, obj_solid)) {
	while(! place_meeting(x, y + sign(vertical_speed), obj_solid)) {
		y += sign(vertical_speed);
	}
	
	vertical_speed = 0;

}

y += vertical_speed;