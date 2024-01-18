import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PaceCalculatorMenuDelegate extends WatchUi.MenuInputDelegate {
    private var _speedConverter as SpeedConverter;

    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :pace) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            WatchUi.pushView(
                new PacePicker(_speedConverter),
                new PaceDelegate(_speedConverter),
                WatchUi.SLIDE_DOWN
            );
        } else if (item == :speed) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            WatchUi.pushView(
                new SpeedPicker(_speedConverter),
                new SpeedDelegate(_speedConverter),
                WatchUi.SLIDE_DOWN
            );
        }
    }

}
