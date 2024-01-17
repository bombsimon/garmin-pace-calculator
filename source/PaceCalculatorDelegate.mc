import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorDelegate extends WatchUi.BehaviorDelegate {
    var _paceDelegate as PaceDelegate;
    var _pacePicker as PacePicker;

    function initialize(view as PaceCalculatorView) {
        _pacePicker = new PacePicker($.Rez.Strings.pace_picker_title.toString());
        _paceDelegate = new PaceDelegate(view, _pacePicker);

        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(
            new $.Rez.Menus.MainMenu(),
            new $.PaceCalculatorMenuDelegate(_pacePicker, _paceDelegate), 
            WatchUi.SLIDE_UP
        );

        return true;
    }
}
