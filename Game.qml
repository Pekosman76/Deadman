import QtQuick 2.0

Item {

    width: parent.width
    height: parent.height

    focus  : true
    property var charactercomponent :Qt.createComponent("Character.qml")
    property var character :[]
    property var missilecomponent :Qt.createComponent("Missile.qml")
    property var missile :[]
    property int i :1
    property int j :1
    property int textscores1 : 0
    property int textscores2 : 0



    onVisibleChanged:  {
        character[1]=charactercomponent.createObject(parent, {"x":0, "y": 0, "img": "qrc:/character/ca.png", "isMovingRight" : true});
        character[2]=charactercomponent.createObject(parent, {"x":((game.width)-30), "y": 0, "img": "qrc:/character/c.png", "isMovingLeft" : true});

        textscores1 = 0
        textscores2 = 0
    }

    Keys.onPressed: {

        if (event.key === Qt.Key_R) {
            if (event.isAutoRepeat) return;
            else
                character[1].moveinputup = true
        }
        if (event.key ===  Qt.Key_D) {
            if (event.isAutoRepeat) return;
            else
                character[1].moveinputdown = true
        }
        if (event.key === Qt.Key_6) {
            if (event.isAutoRepeat) return;
            else
                character[2].moveinputup = true
        }

        if (event.key ===  Qt.Key_2) {
            if (event.isAutoRepeat) return;
            else
                character[2].moveinputdown = true
        }

        if (event.key ===  Qt.Key_W) {

            if (event.isAutoRepeat) return;
            else
            {
                missile[i]=missilecomponent.createObject(parent, {"x":character[1].x, "y": character[1].y, "img" : "qrc:/Missile/missile.png"});
                missile[i].moveinputright= true
                i++
            }
        }
        if (event.key ===  Qt.Key_Down) {
            if (event.isAutoRepeat) return;
            else
            {
                missile[j]=missilecomponent.createObject(parent, {"x":character[2].x, "y": character[2].y, "img" : "qrc:/Missile/missile.png"});
                missile[j].moveinputleft = true
                missile[j].rotation = 180
                j++
            }
        }
    }
    Keys.onReleased: {
        if(event.isAutoRepeat) return ;

        if ((event.key === Qt.Key_R)) {
            character[1].moveinputup = false;
        }
        if (event.key ===  Qt.Key_D) {
            character[1].moveinputdown = false;
        }
        if ((event.key === Qt.Key_6)) {
            character[2].moveinputup = false;
        }
        if (event.key ===  Qt.Key_2) {
            character[2].moveinputdown = false;
        }
    }

    Rectangle{
        width: 50
        height: 20
        color : "#D8D8D8"
        anchors.top : parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        Row{
            anchors.centerIn: parent
            spacing: 5
            Text{

                id : score1
                color: "#07000d"
                text: textscores1.toString()
            }
            Text{

                id : score2
                color: "#07000d"
                text: textscores2.toString()

            }
        }

    }

}

