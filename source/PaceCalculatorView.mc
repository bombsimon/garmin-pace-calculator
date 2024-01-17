import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class PaceCalculatorView extends WatchUi.View {
    private var _font as FontDefinition;
    private var _fontHeight as Number;
    private var _centerX as Number;
    private var _centerY as Number;

    var speedConverter as SpeedConverter;

    function initialize() {
        _font = Graphics.FONT_SYSTEM_LARGE;
        _fontHeight = Graphics.getFontHeight(_font);
        _centerX = 0;
        _centerY = 0;

        speedConverter = new SpeedConverter();

        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        _centerX = dc.getWidth() / 2;
        _centerY = dc.getHeight() / 2 - (_fontHeight / 2);

        setLayout(Rez.Layouts.SimpleLayout(dc));
    }

    function onShow() as Void {}

    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(_centerX, _centerY, _font, Lang.format("$1$ min/km", [speedConverter.pace]), Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(_centerX, _centerY + _fontHeight, _font, Lang.format("$1$ km/h", [speedConverter.speed.format("%.1f")]), Graphics.TEXT_JUSTIFY_CENTER);
    }

    function onHide() as Void {}

    function updatePace(minutesAndSeconds as Array<Number>) as Void {
        speedConverter.setPaceWithNumbers(minutesAndSeconds);
    }

    function updateSpeed(speed as Float) as Void {
        speedConverter.setSpeed(speed);
    }
}
