import QtQuick 2.5

Item {
    id: item1
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
        anchors.bottomMargin: 50
        anchors.horizontalCenter:  parent.horizontalCenter
    }

    Text{

        id: win
        font.family: "DejaVu Sans"
        font.bold: true
        text: "Winner : "+ winner
        anchors.topMargin: 50
        style: Text.Normal
        font.pixelSize: 20
        anchors.top: buttonLaunchGame.bottom
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


    Key{
        id : homkey2
        anchors.left: buttonLaunchGame.right

        anchors.leftMargin: 30
        anchors.verticalCenter: buttonLaunchGame.verticalCenter
        //anchors.centerIn: root
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

