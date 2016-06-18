import QtQuick 2.6
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtMultimedia 5.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import com.mooers.robert.gui 1.0

/*
  Name: Robert Mooers
  Lab: Lab 2 - Splash Screen
  Project Name: effective-dollop


  */

Window {
    id:window
    visible: true
    width: 1400
    height: 900

    Image {
        id:background
        fillMode: Image.PreserveAspectCrop
        visible:true
        anchors.fill: parent
        source: ":/../image/background.jpg"
    }

    Audio {
        id:backgroundMusic
        audioRole: Audio.MusicRole
        source:"qrc:/../audio/Macadamias.mp3"
        autoLoad: true
        loops: Audio.Infinite
        volume: game.musicVolume
        muted: game.musicMute
        Component.onCompleted: {
            if(game.introText){
                backgroundMusic.play();
            }

        }
    }

    SplashScreen{
        visible: {
            if(game.introText){
                visible = false;
                tb.visible = true;
                buildings.visible = true;
            }
            else{
                visible = true;
            }
        }
    }
    TitleBar {
        id:tb
        visible:false
        anchors.top:parent.top
        anchors.left:parent.left
        anchors.right:parent.right
        height: 1/17 * window.height
    }

    GridView {
        id:buildings
        property bool built: false
        visible:false
        anchors.top:tb.bottom
        anchors.left:parent.left
        anchors.right:parent.right
        anchors.bottom:parent.bottom
        cellWidth: (4/17 * window.height > 120) ? 4/17 * window.height : 120
        cellHeight: (4/17 * window.height > 120) ? 4/17 * window.height : 120
        focus: true
        flow: GridView.TopToBottom

        model: game.buildings

        delegate: Rectangle {
            id:buildDelegate
            property int level: model.level
            width: (4/17 * window.height > 120) ? 4/17 * window.height : 120
            height: (4/17 * window.height > 120) ? 4/17 * window.height : 120
            color: "#00000000"
            Image {
                id: buildIcon

                width: 3/5 * parent.width
                height: 3/5 * parent.width
                y: 20
                anchors.top: parent.top
                anchors.margins: 10
                anchors.horizontalCenter: parent.horizontalCenter
                source: model.icon
                Behavior on width {
                    SpringAnimation {
                        easing.type: Easing.OutElastic;
                        velocity: 250; mass: 1.5;
                        spring: 0.5; damping: 0.05
                    }
                }
                Behavior on height {
                    SpringAnimation {
                        easing.type: Easing.OutElastic;
                        velocity: 250; mass: 1.5;
                        spring: 0.5; damping: 0.05
                    }
                }
            }
            Rectangle{
                id: buildingBackdrop
                color: "Black"
                radius: 5
                width: 3/5 * parent.width
                height: 3/5 * parent.width
                y: 20
                anchors.top: parent.top
                anchors.margins: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Component.onCompleted: {
                    if (level == 0){
                        color.a = 0.5;
                    }
                }
                Behavior on width {
                    SpringAnimation {
                        easing.type: Easing.OutElastic;
                        velocity: 250; mass: 1.5;
                        spring: 0.5; damping: 0.05
                    }
                }
                Behavior on height {
                    SpringAnimation {
                        easing.type: Easing.OutElastic;
                        velocity: 250; mass: 1.5;
                        spring: 0.5; damping: 0.05
                    }
                }
            }
            ColorOverlay {
                    anchors.fill:  buildIcon
                    source:  buildIcon
                    color: model.color
            }
            Text {
                id:buildText
                anchors.top: buildIcon.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: model.name + " level " + level
            }
            Text {
                id:buildDescr
                anchors.top: buildText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                text: model.description
            }
            Text {
                id:buildDescr2
                anchors.top: buildDescr.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Produces: " + model.resourceProduced + (model.amountResourceTaken ? " Uses: " + model.resourceTaken : "")
            }
            Text {
                id:buildPrice
                anchors.top: buildDescr2.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Cost to upgrade: " + (Math.round((model.amountToBuild * Math.pow(model.multiplierToBuild, model.level)))) + " " + model.resourceToBuild
            }

            Rectangle {
                id:levelup
                width: 2/8 * buildDelegate.width; height: 1/8 * parent.height;
                anchors.right: parent.right
                anchors.top: parent.top
                z: buildings.currentItem.z + 5
                radius:5;
                Text {
                    anchors.centerIn: parent
                    text: "Upgrade"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (game.addItem(model.resourceToBuild, -(Math.round((model.amountToBuild * Math.pow(model.multiplierToBuild, model.level)))))){
                            model.level = model.level + 1
                        }
                    }
                }

            }
            Timer {
                interval: 500; running: true; repeat: true
                onTriggered: {
                   if (model.level > 0){
                       if (model.amountResourceTaken == 0){
                           game.addItem(model.resourceProduced, model.amountResourceProduced * model.level)
                       }
                       else if (game.addItem(model.resourceTaken, -model.amountResourceTaken * model.level)){
                           game.addItem(model.resourceProduced, model.amountResourceProduced * model.level)
                       }
                   }
                   if (level == 0){
                       buildingBackdrop.color.a = 0.5;
                   }
                   else {
                       buildingBackdrop.color.a = 1;
                   }
                }
            }
            Connections {
                target: model
                onLevelChanged: level = model.level
            }
        }
        Timer {
            interval: 250; running: true; repeat: true
            onTriggered: {
               if (buildings.built == true){
                   buildings.forceLayout()
               }
            }
        }
        Component.onCompleted: {
            buildings.built = true
        }
    }

    GridView {
        id:inventory
        property bool built: false
        visible:false
        anchors.top:tb.bottom
        anchors.left:parent.left
        anchors.right:parent.right
        anchors.bottom:parent.bottom
        cellWidth: (4/17 * window.height > 120) ? 4/17 * window.height : 120
        cellHeight: (4/17 * window.height > 120) ? 4/17 * window.height : 120
        focus: true
        flow: GridView.TopToBottom

        model: game.invItems

        delegate: Rectangle {
            property int amount: amount
            width: (4/17 * window.height > 120) ? 4/17 * window.height : 120
            height: (4/17 * window.height > 120) ? 4/17 * window.height : 120
            color: "#00000000"
            Image {
                id: invIcon

                width: 3/4 * parent.width
                height: 3/4 * parent.width
                y: 20
                anchors.top: parent.top
                anchors.margins: 10
                anchors.horizontalCenter: parent.horizontalCenter
                source: model.icon
            }
            Rectangle{
                color: "Black"
                radius: 5
                width: 3/4 * parent.width
                height: 3/4 * parent.width
                y: 20
                anchors.top: parent.top
                anchors.margins: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ColorOverlay {
                    anchors.fill: invIcon
                    source:  invIcon
                    color: model.color
            }
            Text {
                id:invText
                anchors.top: invIcon.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: model.amount + " " + model.name
            }
            Text {
                id:invDescription
                anchors.top: invText.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                text: model.description
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }
            Connections {
                target: model
                onAmountChanged: amount = model.amount
            }
        }
    }

    Rectangle {
        id: settings
        visible:false
        z: parent.z + 5
        color: "Grey"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.top: tb.bottom

        Component.onCompleted: {
            color.a = 0.8;
        }
        MouseArea {
            anchors.fill: parent
        }
        Rectangle {
            anchors.centerIn: parent
            color: "LightGrey"
            border.width: 8
            border.color: "DarkGrey"
            radius: 8
            height:parent.height / 1.5
            width: (parent.width / 4 > 256) ? parent.width / 4 : 256
            Button {
                anchors.top: parent.top
                anchors.right: parent.right
                z: parent.z + 2
                text: "X"
                style: ButtonStyle {
                    background : Rectangle {
                        implicitWidth: 25
                        implicitHeight: 25
                        color: "Red"
                        border.width: 4
                        border.color: "DarkRed"
                        radius: 4
                    }
                }
                onClicked: {
                    settings.visible = false
                }
            }
            Grid {
                anchors.fill: parent
                flow: Grid.TopToBottom
                verticalItemAlignment: Grid.AlignVCenter
                horizontalItemAlignment: Grid.AlignHCenter
                columns: 1
                spacing: 10
                padding:20
                Text {
                    text: "Settings"
                    font.bold: true
                    font.italic: true
                    font.pointSize: 16
                }
                Text {
                    text: "Music Volume"
                }
                Slider {
                    width: parent.width - (parent.padding * 2)
                    value: game.musicVolume
                    updateValueWhileDragging: true
                    onValueChanged: {
                        game.musicVolume = value
                        backgroundMusic.volume = game.musicVolume
                    }
                }
                CheckBox{
                    text: "Mute Music"
                    checked: game.musicMute
                    onClicked: {
                        game.musicMute = checked
                        backgroundMusic.muted = game.musicMute
                    }
                }
                CheckBox{
                    text: "Hide Introduction"
                    checked: game.introText
                    onClicked: {
                        game.introText = checked
                    }
                }
            }

        }
    }
}
