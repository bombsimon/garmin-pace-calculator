import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class PacePicker extends WatchUi.Picker {
    //! Constructor
    //! @param sc Speed converter object
    function initialize(sc as SpeedConverter) {
        var text = new WatchUi.Text({
            :text => $.Rez.Strings.pace_picker_title,
            :font => Graphics.FONT_SYSTEM_XTINY,
            :locX => WatchUi.LAYOUT_HALIGN_CENTER,
            :locY => WatchUi.LAYOUT_VALIGN_TOP,
            :color => Graphics.COLOR_WHITE,
        });

        WatchUi.Picker.initialize({
            :title => text,
            :pattern => createNumberPattern(),
            :defaults => sc.pacePickerDefaults,
        });

        WatchUi.requestUpdate();
    }

    //! Create pattern (different fields) to set for the picker.:__version
    //! @return An array of number factory items
    function createNumberPattern() as Array<$.NumberFactory> {
        return (
            [
                new $.NumberFactory(0, 60, 1, { :format => "%d" }),
                new $.NumberFactory(0, 60, 1, { :format => "%02d" }),
            ] as Array<$.NumberFactory>
        );
    }
}
