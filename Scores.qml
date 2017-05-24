import QtQuick 2.0

Rectangle{
    width: 150
    height: 20
    color : "#D8D8D8"
    property string scorep1
    property string scorep2

    Row{
        anchors.centerIn: parent
        spacing: 5
        Text{
            color: "#07000d"
            text: "Player 1 "
        }
        Text{
            color: "#07000d"
            text: scorep1
        }
        Text{
            color: "#07000d"
            text: scorep2
        }

        Text{
            color: "#07000d"
            text: "Player 2"
        }
    }
}

