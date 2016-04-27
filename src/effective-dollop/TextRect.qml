import QtQuick 2.0

/*
  Robert Mooers

  TextRect

  */

Item {
    id: textRectRoot
    property alias font: textRectText.font
    property alias text: textRectText.text
    property int borderWidth : 2
    property color color: "lightgrey"
    property color borderColor: Qt.darker(color)
    property real length: textRectText.width + 10 + (2 * borderWidth)
    property real tallness: textRectText.height + 10 + (2 * borderWidth)

    height: tallness
    width: length

    Rectangle {
        id:borderLeft
        anchors.fill: parent

        anchors.rightMargin: 8
        color: borderColor
        z: -1
    }
    Rectangle {
        id: borderBottom
        anchors.fill: parent
        anchors.topMargin: 8
        color: borderColor
        z: -1
    }

    Rectangle {
        id: borderCenter
        anchors.fill: parent
        color: borderColor
        radius: 8
        z: -1
    }

    Rectangle {
        anchors.fill: parent
        anchors.rightMargin: 8 + borderWidth
        anchors.leftMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.bottomMargin: borderWidth
        color: textRectRoot.color
    }

    Rectangle {
        anchors.fill: parent
        anchors.topMargin: 8 + borderWidth
        anchors.leftMargin: borderWidth
        anchors.bottomMargin: borderWidth
        anchors.rightMargin: borderWidth
        color: textRectRoot.color
    }

    Rectangle {
        anchors.fill: parent
        color: textRectRoot.color
        anchors.leftMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.bottomMargin: borderWidth
        anchors.rightMargin: borderWidth
        radius: 8

        Text {
            id: textRectText
            anchors.centerIn: parent
            text: "Text Goes here."
        }
    }
}
