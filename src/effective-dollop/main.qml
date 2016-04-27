import QtQuick 2.6
import QtQuick.Window 2.2

/*
  Name: Robert Mooers
  Lab: Lab 2 - Splash Screen
  Project Name: effective-dollop


  */

Window {
    visible: true
    width: 1400
    height: 900

    Dialog {
        id:firstSplash
        textWidth: 0.8 * parent.width
        text: "<img src=\"http://www.avatar-zone.com/Avatars/Simpsons/Simpsons-40.gif\" alt=\"Cool Image\" > <br \> asdfasdf <br \>WHAT HAVE I DONE"

        textHeight: 256
        textBorderWidth: 16
        buttonText: "Attempt to kill the annoying thing."
        x: 0.1 * parent.width
        y:0
        onClicked: {
            console.log("I've been clicked!")
            secondSplash.visible = true
        }
    }
    Dialog {
        id:secondSplash
        visible:false
        textWidth: 0.8 * parent.width
        text: "<img src=\"http://www.avatar-zone.com/Avatars/Simpsons/Simpsons-40.gif\" alt=\"Cool Image\" > <br \> You cannot kill me! <br \> I am the immortal avatar."

        textHeight: 256
        textBorderWidth: 16
        buttonText: "Kill the annoying thing."
        x: 0.1 * parent.width
        y:0
        onClicked: {
            console.log("I've been clicked!")
        }

    }

    /* Testing for given Button and TextRect Components.
    Column {
        id: row
        anchors.centerIn: parent
        spacing: 2

        TextRect{
            borderWidth: 4
            text: "What has been done cannot be undone.\n Lorem IPSUM."
        }

        Button {
            id: button
            property int numClicked: 0
            text: "Something about a long string of text."
            onClicked: {
                numClicked += 1
                text = "Clicks: " + numClicked
            }

            onHoverStarted: {
                color = Qt.lighter(button.color)
            }

            onHoverFinished: {
                color = "slategrey"
            }
        }

        Button {
            id: button2
            text: "Hello World.\nI am a multiline button. \nWhat do I look like?"
            color: "red"
            borderColor: "blue"
            onClicked: {
                text = "Button Clicked!"
            }
            onHoverStarted: {
                color = Qt.darker(button2.color)
            }
            onHoverFinished: {
                color = "red"
            }

        }

    }
    */
}
