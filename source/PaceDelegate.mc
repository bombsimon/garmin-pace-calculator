import Toybox.Lang;
import Toybox.WatchUi;

class PaceDelegate extends WatchUi.PickerDelegate {
    private var _view as PaceCalculatorView;
    private var _pacePicker as PacePicker;

    function initialize(view as PaceCalculatorView, picker as PacePicker) {
        _pacePicker = picker;
        _view = view;

        PickerDelegate.initialize();
    }

    function onAccept(minutesAndSeconds) {
        _pacePicker.updateDefaults(minutesAndSeconds as Array<Number>);
        _view.updatePace(minutesAndSeconds as Array<Number>);

        WatchUi.popView(WatchUi.SLIDE_UP);

        return true;
    }

    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_UP);

        return true;
    }
}
