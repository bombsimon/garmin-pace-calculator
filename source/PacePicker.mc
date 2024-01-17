import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class PacePicker extends WatchUi.Picker {
    private var _text as WatchUi.Text;
    private var _pattern as Array<$.NumberFactory>;

	function initialize(titleText as String){
		_text = new WatchUi.Text({
            :text => titleText,
            :font => Graphics.FONT_SYSTEM_XTINY,
            :locX => WatchUi.LAYOUT_HALIGN_CENTER,
            :locY => WatchUi.LAYOUT_VALIGN_TOP,
            :color => Graphics.COLOR_WHITE}
        );
        _pattern = createNumberPattern();

        WatchUi.Picker.initialize({
            :title => _text,
            :pattern => _pattern,
            :defaults => [ 5, 15 ] as Array<Number>,
        });

		WatchUi.requestUpdate();
	}

    function updateDefaults(defaults as Array<Number>) as Void {
        WatchUi.Picker.setOptions({ 
            :title => _text,
            :pattern => _pattern,
            :defaults => defaults,
        });
    }

	function createNumberPattern() as Array<$.NumberFactory> {
        return [
            new $.NumberFactory(0, 59, 1, { :format => "%d" }),
            new $.NumberFactory(0, 59, 1, { :format => "%02d" }),
        ] as Array<$.NumberFactory>;
	}
}
