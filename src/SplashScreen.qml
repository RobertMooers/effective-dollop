import QtQuick 2.0

Item {
    anchors.fill: parent
    z:5
    Dialog {
        id:firstSplash
        bullet.visible: false
        textRect.width: 0.8 * parent.width
        textRect.textBox.font.pointSize: 14

        textRect.text: "<b>EFFECTIVE DOLLOP </b><br><br>Welcome to Effective Dollop, an incremental progression game about building a civilization from scratch."
        textRect.image.source: "/../image/effective-dollop-icon.png"

        textRect.height: textRect.image.height + 16
        textRect.borderWidth: 4
        button.text: "Continue..."
        x: 0.1 * parent.width
        y: 0.05 * parent.height
        onClicked: {
            secondSplash.visible = true
        }
    }
    Dialog {
        id:secondSplash
        visible:false
        textRect.image.source: "/../image/effective-dollop-icon.png"
        textRect.textBox.font.pointSize: 14
        textRect.width: 0.8 * parent.width
        textRect.text: "In this game, you will have a series of buildings, and an inventory.
            Buildings will take resources to upgrade and to make, and will in turn produce resources.
            If a building doesn't have what it needs to produce, it will wait until it does."

        textRect.height: textRect.image.height + 16
        textRect.borderWidth: 4
        bullet.text: "Don't show this again."
        button.text: "On to the game. "
        x: 0.1 * parent.width
        y: 0.05 * parent.height
        onClicked: {
            if (bullet.checked) {
                game.introText = true;
            }
            tb.visible = true;
            buildings.visible = true;
            backgroundMusic.play();
        }

    }
}
