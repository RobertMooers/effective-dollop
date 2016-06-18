import QtQuick 2.0

Item {
    id: dialogRoot

    property alias drag: dialogMouseArea.drag
    property alias textRect: dialogText
    property alias button: dialogButton
    property alias bullet: dialogBulletButton

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

    BulletButton {
        id: dialogBulletButton
        property color backupColor:color
        anchors.right: dialogButton.left
        anchors.top: dialogText.bottom
        anchors.topMargin: 2
        anchors.rightMargin: 2
    }



}
