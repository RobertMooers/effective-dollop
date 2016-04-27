import QtQuick 2.0

/*
  Robert Mooers

  BUTTON

  */

Item {
    id: buttonRoot
    //Neccessary changeable properties.
    property alias font: buttonLabel.font
    property alias text: buttonLabel.text
    property int borderWidth: 2

    property color color: "slategrey"
    property color borderColor: Qt.darker(color)
    property real length: buttonLabel.width + 16 + (2 * borderWidth)
    property real tallness: buttonLabel.height + 10 + (2 * borderWidth)
    signal clicked
    signal hoverStarted
    signal hoverFinished

    height: tallness
    width: length

    Rectangle {
        id:borderLeft
        anchors.fill: parent
        color: borderColor
        anchors.rightMargin: 8
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
        anchors.leftMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.bottomMargin: borderWidth
        anchors.rightMargin: 8 + borderWidth
        color: buttonRoot.color
        //border.color: Qt.lighter(color)
    }

    //Filling upper corners.
    Rectangle {
        anchors.fill: parent
        anchors.leftMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.rightMargin: borderWidth
        anchors.bottomMargin: 8 + borderWidth
        color: buttonRoot.color
        //border.color: Qt.lighter(color)
    }

    //The main rectangle where work happens.
    Rectangle {
        anchors.fill: parent
        color: buttonRoot.color
        //border.color: Qt.lighter(color)
        anchors.leftMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.bottomMargin: borderWidth
        anchors.rightMargin: borderWidth
        radius: 8

        Text {
            id: buttonLabel
            anchors.centerIn: parent
            text: "Button Text."
        }
        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
               buttonRoot.clicked()
            }
            onEntered: {
                buttonRoot.hoverStarted()
            }
            onExited: {
                buttonRoot.hoverFinished()
            }
        }
    }
}
