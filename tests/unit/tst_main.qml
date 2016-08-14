import QtQuick 2.0
import QtTest 1.0
import Ubuntu.Test 1.0
import "../../"
// See more details at https://developer.ubuntu.com/api/qml/sdk-14.10/Ubuntu.Test.UbuntuTestCase

// Execute these tests with:
//   qmltestrunner

Item {

    width: units.gu(100)
    height: units.gu(75)

    // The objects
    Main {
        id: main
    }

    UbuntuTestCase {
        name: "MainTestCase"

        when: windowShown


        function init() {
            var label = findChild(main, "label");
            compare("Hello world..", label.text);
        }

        function test_clickButtonMustChangeLabel() {
            var button = findChild(main, "button");
            var buttonCenter = centerOf(button)
            mouseClick(button, buttonCenter.x, buttonCenter.y);
            var label = findChild(main, "label");
            tryCompare(label, "text", "..from Cpp Backend", 1);
        }
    }
}

