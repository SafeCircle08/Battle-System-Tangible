function formatTimerMSS(_timer) {
    var totalSec = floor(_timer / GAME_FPS);
    var mins = totalSec div 60;
    var secs = totalSec mod 60;
    
    var sec_text = (secs < 10) ? "0" + string(secs) : string(secs);
    
    return string(mins) + ":" + sec_text;
}