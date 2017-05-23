import QtQuick 2.0

Item{

    id : keyboard
    property string keydown
    property string keyleft
    property string keyright
    property string keyup
    property string keyshoot

    Row{
        id : rowkey
        spacing : 15

        Rectangle {

            width: 40
            height: 40
            color : "#7696b7"
            border.color: "white"
            border.width: 5
            radius: 10


            Text {

                text: keyleft
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 20
            }
        }


        Rectangle {

            width: 40
            height: 40
            color : "#7696b7"
            border.color: "white"
            border.width: 5
            radius: 10

            Text {

                text: keydown
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 20
            }
        }

        Rectangle {

            width: 40
            height: 40
            color : "#7696b7"
            border.color: "white"
            border.width: 5
            radius: 10

            Text {

                text: keyright
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 20
            }
        }
    }
    Rectangle {

        width: 40
        height: 40
        color : "#7696b7"
        border.color: "white"
        border.width: 5
        radius: 10
        anchors.bottom: rowkey.top
        anchors.horizontalCenter: rowkey.horizontalCenter
        anchors.bottomMargin: 15

        Text {
            text: keyup
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 20
        }
    }
    Rectangle {

        id: shootk

        width: 40
        height: 40
        color : "#7696b7"
        border.color: "white"
        border.width: 5
        radius: 10
        anchors.top: rowkey.bottom
        anchors.horizontalCenter: rowkey.horizontalCenter
        anchors.topMargin:  15

        Text {
            text: keyshoot
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 20
        }
    }
    Text {
        text: "SHOOT"
        font.bold: true
        anchors.verticalCenter: shootk.verticalCenter
        anchors.right : shootk.left
        anchors.rightMargin: 10
        font.pixelSize: 10
    }

}

