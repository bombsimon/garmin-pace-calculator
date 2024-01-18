import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorDelegate extends WatchUi.BehaviorDelegate {
    private var _speedConverter as SpeedConverter;

    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        BehaviorDelegate.initialize();
    }

    //! Handle a button being pressed and released
    //! @param evt The key event that occurred
    //! @return true if handled, false otherwise
    public function onKey(evt as KeyEvent) as Boolean {
        var key = evt.getKey();
        if ((WatchUi.KEY_START == key) || (WatchUi.KEY_ENTER == key)) {
            return pushPicker();
        }

        return false;
    }

    function onMenu() as Boolean {
        return pushPicker();
    }

    function pushPicker() as Boolean {
        WatchUi.pushView(
            new $.Rez.Menus.MainMenu(),
            new $.PaceCalculatorMenuDelegate(_speedConverter), 
            WatchUi.SLIDE_UP
        );

        return true;
    }
}
