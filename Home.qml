import QtQuick 2.0

Item {
    width: parent.width
    height: parent.height
    property string winner :"Player "

    Text{

        id: titre
        font.family: "DejaVu Sans"
        font.bold: true
        text: "DEADMAN"
        style: Text.Normal
        font.pixelSize: 50
        anchors.bottom: buttonLaunchGame.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter:  parent.horizontalCenter
    }

    Text{

        id: win
        font.family: "DejaVu Sans"
        font.bold: true
        text: "Winner : "+ winner
        style: Text.Normal
        font.pixelSize: 20
        anchors.top: buttonLaunchGame.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter:  parent.horizontalCenter
    }

    Rectangle {
        id: buttonLaunchGame
        width: 180
        height: 80
        color : "#7696b7"
        border.color: "white"
        border.width: 5
        radius: 10
        anchors.centerIn: parent

        Text {
            id: launchGame
            text: qsTr("JOUER")
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 20
        }

        MouseArea {
            id: mouseAreaLaunchGame
            anchors.fill: parent
            onPressed: {
                buttonLaunchGame.state = "pressed"
            }

            onReleased: {
                buttonLaunchGame.state = "none"
                home.visible= false
                home.focus = false
                game.visible =true
                game.focus = true
                game.creatcomponent()
            }
        }
        states: State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges { target: buttonLaunchGame; scale: 0.8 }

        }
        transitions: Transition {
            NumberAnimation { properties: "scale"; duration: 100; easing.type: Easing.InOutQuad ;}
        }
    }
}

