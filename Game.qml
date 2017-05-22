import QtQuick 2.0

Item {

    width: parent.width
    height: parent.height

    focus  : true
    property var charactercomponent :Qt.createComponent("Character.qml")
    property var character :[]
    property var missilecomponent :Qt.createComponent("Missile.qml")
    property var missile :[]
    property var bousmissile : []
    property var bonuscomponent : Qt.createComponent("Bonus.qml")
    property var bonus : []
    property int i :1
    property int textscores1 : 0
    property int textscores2 : 0

    function creatcomponent(){
        character[1]=charactercomponent.createObject(parent, {"x":0, "y": game.height/2, "img": "character/ca.png", "isMovingRight" : true});
        character[2]=charactercomponent.createObject(parent, {"x":((game.width)-30), "y": game.height/2, "img": "character/c.png", "isMovingLeft" : true});

        textscores1 = 0
        textscores2 = 0
        bonustimer.start()
        i=1
    }

    function destroycomponent(){
        bonustimer.destroy()
        character[1].destroy()
        character[2].destroy()
    }


    Timer{

        id : bonustimer
        interval: 5000
        running: false
        repeat: true
        onTriggered: {

            bonus[1]= bonuscomponent.createObject(parent,{"x" : getNumber()})

        }
    }

    Keys.onPressed: {

        if (event.key === Qt.Key_T) {
            if (event.isAutoRepeat) return;
            else
                character[1].moveinputup = true
        }
        if (event.key ===  Qt.Key_G) {
            if (event.isAutoRepeat) return;
            else
                character[1].moveinputdown = true
        }
        if (event.key === Qt.Key_F) {
            if (event.isAutoRepeat) return;
            else
                character[1].moveinputleft = true
        }
        if (event.key ===  Qt.Key_H) {
            if (event.isAutoRepeat) return;
            else
                character[1].moveintputright = true
        }

        if (event.key === Qt.Key_5) {
            if (event.isAutoRepeat) return;
            else
                character[2].moveinputup = true
        }

        if (event.key ===  Qt.Key_2) {
            if (event.isAutoRepeat) return;
            else
                character[2].moveinputdown = true
        }
        if (event.key === Qt.Key_1) {
            if (event.isAutoRepeat) return;
            else
                character[2].moveinputleft = true
        }

        if (event.key ===  Qt.Key_3) {
            if (event.isAutoRepeat) return;
            else
                character[2].moveintputright = true
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
                missile[i]=missilecomponent.createObject(parent, {"x":character[2].x, "y": character[2].y, "img" : "qrc:/Missile/missile.png"});
                missile[i].moveinputleft = true
                missile[i].rotation = 180
                i++
            }
        }
    }
    Keys.onReleased: {
        if(event.isAutoRepeat) return ;

        if ((event.key === Qt.Key_T)) {
            character[1].moveinputup = false;
        }
        if (event.key ===  Qt.Key_G) {
            character[1].moveinputdown = false;
        }
        if ((event.key === Qt.Key_F)) {
            character[1].moveinputleft= false;
        }
        if (event.key ===  Qt.Key_H) {
            character[1].moveintputright = false;
        }
        if ((event.key === Qt.Key_5)) {
            character[2].moveinputup = false;
        }
        if (event.key ===  Qt.Key_2) {
            character[2].moveinputdown = false;
        }
        if ((event.key === Qt.Key_1)) {
            character[2].moveinputleft= false;
        }
        if (event.key ===  Qt.Key_3) {
            character[2].moveintputright = false;
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
    function randomNumber() {
        return Math.random()*(root.width/1.25);
    }

    function getNumber() {
        return game.randomNumber();
    }

}

