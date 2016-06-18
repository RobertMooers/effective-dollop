import QtQuick 2.0

Rectangle {

    color: Qt.rgba(0.5, 0.5, 0.5, 0.5);
    Button {
        id: bBuildings
        text: "Buildings"
        width: 1/3 * window.width
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        onClicked: {
            buildings.visible = true;
            inventory.visible = false;
            settings.visible = false;
        }
    }
    Button {
        id: bInventory
        text: "Inventory"
        anchors.left: bBuildings.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 1/3 * window.width
        onClicked: {
            buildings.visible = false;
            inventory.visible = true;
            settings.visible = false;
        }
    }
    Button {
        id: bSettings
        text: "Settings"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 1/6 * window.width
        onClicked: {
            settings.visible = true;
        }
    }
}
