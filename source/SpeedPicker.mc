import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class SpeedPicker extends WatchUi.Picker {
	function initialize(sc as SpeedConverter){
		var text = new WatchUi.Text({
            :text => $.Rez.Strings.speed_picker_title,
            :font => Graphics.FONT_SYSTEM_XTINY,
            :locX => WatchUi.LAYOUT_HALIGN_CENTER,
            :locY => WatchUi.LAYOUT_VALIGN_TOP,
            :color => Graphics.COLOR_WHITE}
        );

        // TODO: Find defaults
        WatchUi.Picker.initialize({
            :title => text,
            :pattern => createNumberPattern(),
            :defaults => sc.speedPickerDefaults,
        });

		WatchUi.requestUpdate();
	}

	function createNumberPattern() as Array<$.NumberFactory> {
        return [
            new $.NumberFactory(0, 60, 1, { :format => "%d" }),
            new $.NumberFactory(0, 10, 1, { :format => "%d" }),
        ] as Array<$.NumberFactory>;
	}
}
