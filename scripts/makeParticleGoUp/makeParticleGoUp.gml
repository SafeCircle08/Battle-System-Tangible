function makeParticleGoUp(_spd, _timerValue, _exponential = false) 
{
    if (!variable_instance_exists(id, "timer")) {
        id.timer = 0;
    }
	id.timer += 0.005;
	
    if (_exponential) {
        id.y -= _spd * power(id.timer, 2);
    } else {
        id.y -= _spd * id.timer;
    }
}