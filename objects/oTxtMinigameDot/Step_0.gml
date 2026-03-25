if (drawAlpha < MAX_DRAW_ALPHA) drawAlpha += 0.05;

drawX = x - dx;
drawY = y - dy;

if (!dragging && mouse_check_button_pressed(mb_left) && mouseIsHovering()) {
    dragging = true;
    drag_offset_x = x - mouse_x;
    drag_offset_y = y - mouse_y;
}

if (dragging && mouse_check_button_released(mb_left)) {
    dragging = false;
	if (hoveringTime >= MAX_HOVERED_DELAY) updateRefXYPos(x, y);
	hoveringTime = 0;
}

if (dragging && mouse_check_button(mb_left)) {
	hoveringTime++;	
    x = mouse_x + drag_offset_x;
    y = mouse_y + drag_offset_y;
}

if (!dragging && mouseIsHovering()) {
    calculateTransitionedValues(MAX_RADIUS, MAX_FREQ_SPD, MAX_STAR_POWER);
} else if (!dragging) {
    calculateTransitionedValues(MIN_RADIUS, MIN_FREQ_SPD, MIN_STAR_POWER);
}

if (!dragging && !(mouseIsHovering())) {
    t += 5.0 / 1_00
    y = y_0 + sin(t * 2);
    x = x_0 + cos(t * 0.5);
}
