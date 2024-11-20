import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

//! The PaceCalculator app is an app that can convert between pace (min/km) and
//! speed (km/h).
class PaceCalculatorApp extends Application.AppBase {
    private var _speedConverter as SpeedConverter;

    function initialize() {
        _speedConverter = new SpeedConverter();

        AppBase.initialize();
    }

    //! onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {}

    //! onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {}

    //! Returns initial view of application.
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [
            new PaceCalculatorView(_speedConverter),
            new PaceCalculatorDelegate(_speedConverter),
        ];
    }
}

function getApp() as PaceCalculatorApp {
    return Application.getApp() as PaceCalculatorApp;
}
