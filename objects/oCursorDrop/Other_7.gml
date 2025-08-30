if (instance_number(oCursorDrop) == 1) { oCustomCursor.setUpCursorVars(); }
else { oCustomCursor.setUpCursorVars(global.choosenCursor.angle, 1, false); }

playSound(dropSound, SOUND_CHANNEL_3);
instance_destroy();