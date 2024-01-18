import Toybox.Lang;
import Toybox.WatchUi;

class SpeedDelegate extends WatchUi.PickerDelegate {
    private var _speedConverter as SpeedConverter;

    //! Constructor
    //! @param sc Speed converter object
    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        PickerDelegate.initialize();
    }

    //! Handle confirming the picker selections.
    //! @param minutesAndSeconds Array for all elements (minutes and seconds)
    //! @return True when handled.
    function onAccept(wholesAndFraction) {
        _speedConverter.setSpeedWithNumberAndFraction(wholesAndFraction as Array<Number>);
        WatchUi.popView(WatchUi.SLIDE_UP);

        return true;
    }

    //! Handle canceling the picker selections.
    //! @return True when handled.
    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_UP);

        return true;
    }
}
