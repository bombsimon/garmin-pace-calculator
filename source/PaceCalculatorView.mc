import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorView extends WatchUi.View {
    private var _font as FontDefinition;
    private var _fontHeight as Number;
    private var _centerX as Number;
    private var _centerY as Number;
    private var _speedConverter as SpeedConverter;

    function initialize(sc as SpeedConverter) {
        _font = Graphics.FONT_SYSTEM_LARGE;
        _fontHeight = Graphics.getFontHeight(_font);
        _centerX = 0;
        _centerY = 0;
        _speedConverter = sc;

        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        _centerX = dc.getWidth() / 2;
        _centerY = dc.getHeight() / 2 - (_fontHeight / 2);

        setLayout(Rez.Layouts.SimpleLayout(dc));
    }

    function onShow() as Void {}

    function onHide() as Void {}

    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            _centerX,
            _centerY,
            _font,
            Lang.format("$1$ min/km", [_speedConverter.pace]),
            Graphics.TEXT_JUSTIFY_CENTER
        );
        dc.drawText(
            _centerX,
            _centerY + _fontHeight,
            _font,
            Lang.format("$1$ km/h", [_speedConverter.speed.format("%.1f")]),
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
}
