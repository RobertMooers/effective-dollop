import QtQuick 2.0
import QtQuick.Controls 1.4

/*
  Robert Mooers

  BUTTON

  */

Item {
    id: bulletButtonRoot
    //Neccessary changeable properties.
    property alias text: buttonLabel.text
    property int borderWidth: 2

    property color color: "slategrey"
    property color borderColor: Qt.darker(color)
    property real length: buttonLabel.width + 16 + (2 * borderWidth)
    property real tallness: buttonLabel.height + 10 + (2 * borderWidth)
    property alias checked: buttonLabel.checked
    signal hoverStarted
    signal hoverFinished

    height: tallness
    width: length

    Rectangle {
        id:borderright
        anchors.fill: parent
        color: borderColor
        anchors.leftMargin: 8
        z: -1
    }
    Rectangle {
        id:borderTop
        anchors.fill: parent
        color: borderColor
        anchors.bottomMargin: 8
        z: -1
    }

    Rectangle {
        id:borderCenter
        anchors.fill: parent
        color: borderColor
        radius: 8
        z: -1
    }

    //Filling upper corners.
    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.bottomMargin: borderWidth
        anchors.leftMargin: 8 + borderWidth
        color: bulletButtonRoot.color
    }

    //Filling upper corners.
    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.leftMargin: borderWidth
        anchors.bottomMargin: 8 + borderWidth
        color: bulletButtonRoot.color
    }

    //The main rectangle where work happens.
    Rectangle {
        anchors.fill: parent
        color: bulletButtonRoot.color
        anchors.rightMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.bottomMargin: borderWidth
        anchors.leftMargin: borderWidth
        radius: 8

        RadioButton{
            id: buttonLabel
            text: "Don't show again"
            anchors.centerIn: parent
        }

    }
}
