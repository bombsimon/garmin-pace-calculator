import Toybox.Application.Storage;
import Toybox.Application;
import Toybox.Communications;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

(:glance)
class PaceCalculatorGlanceView extends WatchUi.GlanceView {
    private var _speedConverter as SpeedConverter;

    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;
        GlanceView.initialize();
    }

    function getLayout() as Void {}

    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            0,
            dc.getHeight() / 3,
            Graphics.FONT_TINY,
            Lang.format("$1$ min/km", [_speedConverter.pace]),
            Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER
        );
        dc.drawText(
            0,
            dc.getHeight() / 1.5,
            Graphics.FONT_TINY,
            Lang.format("$1$ km/h", [_speedConverter.speed.format("%.1f")]),
            Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }
}
