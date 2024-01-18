import Toybox.Lang;
import Toybox.WatchUi;

class PaceDelegate extends WatchUi.PickerDelegate {
    private var _speedConverter as SpeedConverter;

    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        PickerDelegate.initialize();
    }

    function onAccept(minutesAndSeconds) {
        _speedConverter.setPaceWithNumbers(minutesAndSeconds as Array<Number>);
        WatchUi.popView(WatchUi.SLIDE_UP);

        return true;
    }

    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_UP);

        return true;
    }
}
