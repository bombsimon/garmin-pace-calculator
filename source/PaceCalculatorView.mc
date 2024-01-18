import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorView extends WatchUi.View {
    private var _speedConverter as SpeedConverter;

    //! Constructor
    //! @param sc Speed converter object
    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        View.initialize();
    }

    //! Set the layout to be used for the view.
    //! @param dc The drawing context
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.PaceLayout(dc));
    }

    //! Handle when the app is shown to screen.
    function onShow() as Void {
        var pace = findDrawableById("pace") as Text;
        pace.setText(Lang.format("$1$ min/km", [_speedConverter.pace]) as String);

        var speed = findDrawableById("speed") as Text;
        speed.setText(Lang.format("$1$ km/h", [_speedConverter.speed.format("%.1f")]) as String);
    }

    //! Handle when the app is removed from screen.
    function onHide() as Void {}

    //! Handle app update tick.
    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
    }
}
