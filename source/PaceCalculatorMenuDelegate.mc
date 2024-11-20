import Toybox.Lang;
import Toybox.Application;
import Toybox.System;
import Toybox.WatchUi;

import TouchKeypad;

class PaceCalculatorMenuDelegate extends WatchUi.MenuInputDelegate {
    private var _speedConverter as SpeedConverter;

    //! Constructor
    //! @param sc Speed converter object
    function initialize(sc as SpeedConverter) {
        _speedConverter = sc;

        MenuInputDelegate.initialize();
    }

    //! Push view based on which menu item was pressed.
    //! @param sc Speed converter object
    function onMenuItem(item as Symbol) as Void {
        var settings = System.getDeviceSettings();
        var useTouch = Properties.getValue("useTouch") as Boolean;

        if (item == :pace) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);

            if (useTouch && settings.isTouchScreen) {
                var view = new NumpadView({
                    :callback => method(:paceCallback),
                    :input => "",
                    :separator => ":",
                    :separatorLimit => 1,
                    :vibrate => true,
                });
                var delegate = new NumpadDelegate(view);

                WatchUi.pushView(view, delegate, WatchUi.SLIDE_DOWN);
            } else {
                WatchUi.pushView(
                    new PacePicker(_speedConverter),
                    new PaceDelegate(_speedConverter),
                    WatchUi.SLIDE_DOWN
                );
            }
        } else if (item == :speed) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);

            if (useTouch && settings.isTouchScreen) {
                var view = new NumpadView({
                    :callback => method(:speedCallback),
                    :input => "",
                    :separator => ".",
                    :separatorLimit => 1,
                    :vibrate => true,
                });
                var delegate = new NumpadDelegate(view);

                WatchUi.pushView(view, delegate, WatchUi.SLIDE_DOWN);
            } else {
                WatchUi.pushView(
                    new SpeedPicker(_speedConverter),
                    new SpeedDelegate(_speedConverter),
                    WatchUi.SLIDE_DOWN
                );
            }
        }
    }

    private function getNumberParts(
        input as String,
        separator as String
    ) as Array<Number>? {
        var separatorIsAt = input.find(separator);
        if (separatorIsAt == null) {
            var maybeNumber = input.toNumber();
            if (maybeNumber != null) {
                return [maybeNumber, 0];
            }

            return null;
        }

        var first = input.substring(0, separatorIsAt);
        if (first == null) {
            return null;
        }

        // We do allow empty second value since we wan't e.g. 4. to be seen as
        // 4.0 and 3: to be seen as 3:00.
        if (separatorIsAt + 1 == input.length()) {
            return [first.toNumber() as Number, 0];
        }

        // Some versions can't handle `null` as second argument to `substring`
        // even thoug the docs says it should be valid. Let's just use the
        // length of the string instead to capture the rest!
        var second = input.substring(separatorIsAt + 1, input.length());
        if (second == null) {
            return null;
        }

        return [first.toNumber() as Number, second.toNumber() as Number];
    }

    function paceCallback(input as String) as Void {
        var pace = getNumberParts(input, ":");
        if (pace == null) {
            return;
        }

        _speedConverter.setPaceWithNumbers(pace);
    }

    function speedCallback(input as String) as Void {
        var speed = getNumberParts(input, ".");
        if (speed == null) {
            return;
        }

        _speedConverter.setSpeedWithNumberAndFraction(speed);
    }
}
