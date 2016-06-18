import QtQuick 2.0

/*
  Robert Mooers

  TextRect

  */

Item {
    id: textRectRoot
    property alias font: trText.font
    property alias text: trText.text
    property alias textBox: trText
    property alias image: trImage
    property int borderWidth : 2
    property color color: "lightgrey"
    property color borderColor: Qt.darker(color)
    property real length: trText.contentWidth + 10 + (2 * borderWidth)
    property real tallness: trText.contentHeight + 10 + (2 * borderWidth)

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
    Image{
        id:trImage
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins:  4 + borderWidth
    }

    Rectangle {
        anchors.top: parent.top
        anchors.right:parent.right
        anchors.left:trImage.right
        anchors.bottom:parent.bottom
        color: textRectRoot.color
        anchors.leftMargin: borderWidth
        anchors.topMargin: borderWidth
        anchors.bottomMargin: borderWidth
        anchors.rightMargin: borderWidth
        radius: 8

        Text {
            id: trText

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            anchors.fill: parent
            text: "Text Goes here."
        }
    }
}
