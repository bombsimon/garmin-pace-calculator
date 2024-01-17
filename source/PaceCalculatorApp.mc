import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorApp extends Application.AppBase {
    private var _paceView as PaceCalculatorView;
    private var _paceDelegate as PaceCalculatorDelegate;

    function initialize() {
        _paceView = new PaceCalculatorView();
        _paceDelegate = new PaceCalculatorDelegate(_paceView);

        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ _paceView, _paceDelegate ] as Array<Views or InputDelegates>;
    }
}

function getApp() as PaceCalculatorApp {
    return Application.getApp() as PaceCalculatorApp;
}
