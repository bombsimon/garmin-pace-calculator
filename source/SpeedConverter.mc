import Toybox.Lang;
import Toybox.Math;

class SpeedConverter {
    var speed as Float;
    var pace as String;

    function initialize() {
        speed = 0.0;
        pace = "";

        setPace("5:15");
    }

    function setSpeed(_speed as Float) as Void {
        speed = _speed;
        updatePace();
    }

    function setPace(_pace as String) as Void {
        pace = _pace;
        updateSpeed();
    }

    function setPaceWithNumbers(minutesAndSeconds as Array<Number>) as Void {
        var pace = Lang.format(
            "$1$:$2$",
            [
                minutesAndSeconds[0].format("%d"),
                minutesAndSeconds[1].format("%02d"),
            ]
        );

        setPace(pace);
    }

    private function updatePace() as Void {
        var pace = 60 / speed as Float;
        var minutes = Math.floor(pace) as Number;
        var seconds = Math.round((pace - minutes) * 60);
        
        pace = Lang.format("$1$:$2$", [ minutes.format("%02d"), seconds.format("%02d") ]);
    }

    private function updateSpeed() as Void {
        var minutesAndSeconds = splitTime(pace) as Array<Number>;
        var paceInHours = minutesAndSeconds[0] / 60 + minutesAndSeconds[1] / 3600;

        speed = 1 / paceInHours as Float;
    }

    private function splitTime(time as String) as Array<Float> {
        var index = time.find(":") as Number;
        var minutes = 0;
        var seconds = 0;

        var minuteString = time.substring(0, index);
        var secondString = time.substring(index + 1, time.length());

        if (minuteString instanceof String) {
            minutes = minuteString.toFloat() as Float;
        }

        if (secondString instanceof String) {
            seconds = secondString.toFloat() as Float;
        }

        return [ minutes, seconds ] as Array<Float>;
    }
}
