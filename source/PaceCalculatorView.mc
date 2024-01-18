import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorView extends WatchUi.View {
    private var _speedConverter as SpeedConverter;

    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.PaceLayout(dc));
    }

    function onShow() as Void {
        var pace = findDrawableById("pace") as Text;
        pace.setText(Lang.format("$1$ min/km", [_speedConverter.pace]) as String);

        var speed = findDrawableById("speed") as Text;
        speed.setText(Lang.format("$1$ km/h", [_speedConverter.speed.format("%.1f")]) as String);
    }

    function onHide() as Void {}

    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
    }
}
