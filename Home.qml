import QtQuick 2.5
import QtGraphicalEffects 1.0

Rectangle {
    id: item1
    width: parent.width
    height: parent.height
    focus : home.focus
    property string winner :"Player "

    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 0.7; color: "#4b6f93" }
        }
    }

    Character{
        id : character1

        anchors.bottom: titre.top
        anchors.left : titre.left
        anchors.bottomMargin: 10
        isMovingRight: true
        img : "qrc:/character/robot1.png"
    }

    Character{
        id : character2

        anchors.bottom: titre.top
        anchors.right : titre.right
        anchors.bottomMargin: 10
        isMovingLeft: true
        img : "qrc:/character/robot2.png"
    }


    HomeMissile{
        anchors.bottom: titre.top
        anchors.bottomMargin: 15
        anchors.horizontalCenter: titre.horizontalCenter
    }


    Text{

        id: titre
        font.family: "DejaVu Sans"
        font.bold: true
        style: Text.Outline
        text: "DEADMAN"
        color :"#4b6f93"
        font.pixelSize: 70
        anchors.bottom: buttonLaunchGame.top
        anchors.bottomMargin: 40
        anchors.horizontalCenter:  parent.horizontalCenter

    }

    DropShadow {
        anchors.fill: titre
        horizontalOffset: 5
        verticalOffset: 8
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: titre
    }

    Text{

        id: win
        color: "#1f8f28"
        font.family: "URW Bookman L"
        font.bold: true
        text: "Winner : "+ winner
        anchors.topMargin: 70
        font.pixelSize: 30
        anchors.top: buttonLaunchGame.bottom
        anchors.horizontalCenter:  parent.horizontalCenter
    }

    Rectangle {
        id: buttonLaunchGame
        width: 180
        height: 80
        color : "white"
        border.color: "#7696b7"
        border.width: 8
        scale: 0.8
        radius: 25
        anchors.centerIn: parent

        Text {
            id: launchGame
            text: qsTr("PLAY")
            color : "#4b6f93"
            font.family: "DejaVu Sans"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 30
        }

        MouseArea {
            id: mouseAreaLaunchGame
            anchors.fill: parent
            onReleased: {
                home.visible= false
                home.focus = false
                game.visible =true
                game.focus = true
                game.creatcomponent()
            }
        }

        PropertyAnimation on scale {  from: buttonLaunchGame.scale;to: 1.2; duration: 2000; loops: Animation.Infinite }
    }

    Key{
        id : homkey2
        anchors.left: buttonLaunchGame.right

        anchors.leftMargin: 45
        anchors.verticalCenter: buttonLaunchGame.verticalCenter
        keydown: "2"
        keyup: "5"
        keyleft: "1"
        keyright: "3"
        keyshoot: "M"
    }
    Key{

        id : homkey1
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        keydown: "G"
        keyup: "T"
        keyleft: "F"
        keyright: "H"
        keyshoot: "W"
    }
}

