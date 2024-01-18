import Toybox.Lang;
import Toybox.Math;
import Toybox.Application.Storage;

class SpeedConverter {
    var speed as Float;
    var pace as String;
    var speedPickerDefaults as Array<Number>;
    var pacePickerDefaults as Array<Number>;

    function initialize() {
        speed = 0.0;
        pace = "";
        speedPickerDefaults = [ 0, 0 ] as Array<Number>;
        pacePickerDefaults = [ 0, 0 ] as Array<Number>;

        var defaultPace = Storage.getValue("pace");
        if (defaultPace == null) {
            defaultPace = "5:15";
        }

        // This will set the pace, compuate and set the speed, save the default
        // value and set the values for the pickers.
        setPace(defaultPace as String);
    }

    function setSpeed(_speed as Float) as Void {
        speed = _speed;
        updatePace();
        updateConfig();
    }

    function setSpeedWithNumberAndFraction(numberAndFraction as Array<Number>) as Void {
        var _speed = numberAndFraction[0] as Float + (numberAndFraction[1] as Float / 10.0);
        setSpeed(_speed);
    }

    function setPace(_pace as String) as Void {
        pace = _pace;
        updateSpeed();
        updateConfig();
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
        var _pace = 60 / speed as Float;
        var minutes = Math.floor(_pace) as Number;
        var seconds = Math.round((_pace - minutes) * 60);

        pace = Lang.format("$1$:$2$", [ minutes.format("%02d"), seconds.format("%02d") ]);
    }

    private function updateSpeed() as Void {
        var minutesAndSeconds = splitTime(pace) as Array<Number>;
        var paceInHours = minutesAndSeconds[0] / 60 + minutesAndSeconds[1] / 3600;

        speed = 1 / paceInHours as Float;
    }

    private function updateConfig() as Void {
        Storage.setValue("pace", pace as String);

        var speedWholeNumber = speed.toNumber();
        var speedFraction = Math.round((speed - speedWholeNumber) * 10) as Number;
        speedPickerDefaults = [ speedWholeNumber, speedFraction ] as Array<Number>;

        pacePickerDefaults = splitTime(pace) as Array<Number>;
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
