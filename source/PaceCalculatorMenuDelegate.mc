import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PaceCalculatorMenuDelegate extends WatchUi.MenuInputDelegate {
    private var _pacePicker as PacePicker;
    private var _paceDelegate as PaceDelegate;

    function initialize(pacePicker as PacePicker, paceDelegate as PaceDelegate) {
        _pacePicker = pacePicker;
        _paceDelegate = paceDelegate;

        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :pace) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            WatchUi.pushView(_pacePicker, _paceDelegate, WatchUi.SLIDE_DOWN);
        } else if (item == :speed) {
            System.println("item 2");
        }
    }

}
