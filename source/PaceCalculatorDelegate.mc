import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorDelegate extends WatchUi.BehaviorDelegate {
    private var _speedConverter as SpeedConverter;

    //! Constructor
    //! @param sc Speed converter object
    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        BehaviorDelegate.initialize();
    }

    //! Handle a button being pressed and released
    //! Not all devices register menu press so we also check for start or enter
    //! key pressed.
    //! @param event The key event that occurred
    //! @return true if handled, false otherwise
    public function onKey(event as KeyEvent) as Boolean {
        var key = event.getKey();
        if (WatchUi.KEY_START == key || WatchUi.KEY_ENTER == key) {
            return pushPicker();
        }

        return false;
    }

    //! Handle menu opening
    //! Will push picket menu view.
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
