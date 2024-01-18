import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorApp extends Application.AppBase {
    private var _speedConverter as SpeedConverter;

    function initialize() {
        _speedConverter = new SpeedConverter();

        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {}

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {}

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [
            new PaceCalculatorView(_speedConverter),
            new PaceCalculatorDelegate(_speedConverter),
        ] as Array<Views or InputDelegates>;
    }
}

function getApp() as PaceCalculatorApp {
    return Application.getApp() as PaceCalculatorApp;
}
