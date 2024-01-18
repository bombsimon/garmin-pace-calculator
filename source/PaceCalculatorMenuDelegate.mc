import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PaceCalculatorMenuDelegate extends WatchUi.MenuInputDelegate {
    private var _speedConverter as SpeedConverter;

    //! Constructor
    //! @param sc Speed converter object
    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        MenuInputDelegate.initialize();
    }

    //! Push view based on which menu item was pressed.
    //! @param sc Speed converter object
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
