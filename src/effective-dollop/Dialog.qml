import QtQuick 2.0

Item {
    id: dialogRoot

    property alias drag: dialogMouseArea.drag
    property int minimumDragX: 0
    property int minimumDragY: 0
    property int maximumDragX: 0
    property int maximumDragY: 0
    property int ex: parent.width / 2
    property int ye: parent.height / 2
    property bool isVisible: true

    signal clicked
    signal hoverStarted
    signal hoverFinished

    visible: isVisible
    x: ex
    y: ye

    property alias textFont: dialogText.font
    property alias text: dialogText.text
    property alias textWidth: dialogText.width
    property alias textHeight: dialogText.height
    property alias textBorderWidth: dialogText.borderWidth
    property alias textColor: dialogText.color
    property alias textBorderColor: dialogText.borderColor

    property alias buttonFont: dialogButton.font
    property alias buttonText: dialogButton.text
    property alias buttonWidth: dialogButton.width
    property alias buttonHeight: dialogButton.height
    property alias buttonBorderWidth : dialogButton.borderWidth
    property alias buttonColor: dialogButton.color
    property alias buttonBorderColor: dialogButton.borderColor


    TextRect {
        id:dialogText
        visible:dialogRoot.visible
        text: "Dialog Example Text."
        MouseArea {
            id:dialogMouseArea
            anchors.fill: dialogText
            drag.target: dialogText
            drag.minimumX: minimumDragX
            drag.minimumY: minimumDragY
            drag.maximumX: maximumDragX
            drag.maximumY: maximumDragY
        }
    }

    Button {
        id: dialogButton
        property color backupColor:color
        visible:dialogRoot.visible
        anchors.right: dialogText.right
        anchors.top: dialogText.bottom
        anchors.topMargin: 2

        onClicked: {
            dialogRoot.visible = false
            dialogRoot.clicked()
        }
        onHoverStarted: {
            backupColor = color
            color = Qt.darker(dialogButton.color)
            dialogRoot.hoverStarted()
        }
        onHoverFinished: {
            color =  backupColor
            dialogRoot.hoverFinished()
        }
    }



}
