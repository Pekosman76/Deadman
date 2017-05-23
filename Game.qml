import QtQuick 2.0

Item {

    width: parent.width
    height: parent.height
    focus  : true

    property var charactercomponent :Qt.createComponent("Character.qml")
    property var missilecomponent :Qt.createComponent("Missile.qml")
    property var bonuscomponent : Qt.createComponent("Bonus.qml")

    property var character :[]
    property var missile :[]
    property var bonus : []

    property int i :1
    property int textscores1 : 0
    property int textscores2 : 0
    property string txtw : "Player"

    function creatcomponent(){

        character[1]=charactercomponent.createObject(parent, {"x":0, "y": game.height/2, "img": "qrc:/character/robot1.png", "isMovingRight" : true});
        character[2]=charactercomponent.createObject(parent, {"x":((game.width)-50), "y": game.height/2, "img": "qrc:/character/robot2.png", "isMovingLeft" : true});

        textscores1 = 0
        textscores2 = 0
        bonustimer.restart()
        i=1
    }

    function destroycomponent(){

        home.winner = txtw
        bonus[1].visible = false
        character[1].visible=false
        character[2].visible=false
        bonustimer.stop()
    }

    Timer{

        id : bonustimer
        interval: 6000
        running: false
        repeat: true
        onTriggered: {

            bonus[1]= bonuscomponent.createObject(parent,{"x" : getNumber(), "y" : getNumber(), "img" :"qrc:/Bonus/Heart.png"})
        }
    }

    Keys.onPressed: {

        if (event.key === Qt.Key_T) {
            if (event.isAutoRepeat) return;
            else
            {
                character[1].moveinputup = true
                changeanim(1,"up")
            }
        }
        if (event.key ===  Qt.Key_G) {
            if (event.isAutoRepeat) return;
            else{
                character[1].moveinputdown = true
                changeanim(1,"down")
            }
        }
        if (event.key === Qt.Key_F) {
            if (event.isAutoRepeat) return;
            else{
                character[1].moveinputleft = true
                changeanim(1,"left")}
        }
        if (event.key ===  Qt.Key_H) {
            if (event.isAutoRepeat) return;
            else{
                character[1].moveintputright = true
                changeanim(1,"right")}
        }

        if (event.key === Qt.Key_5) {
            if (event.isAutoRepeat) return;
            else{
                character[2].moveinputup = true
                changeanim(2,"up")}
        }

        if (event.key ===  Qt.Key_2) {
            if (event.isAutoRepeat) return;
            else{
                character[2].moveinputdown = true
                changeanim(2,"down")}
        }
        if (event.key === Qt.Key_1) {
            if (event.isAutoRepeat) return;
            else{
                character[2].moveinputleft = true
                changeanim(2,"left")}
        }

        if (event.key ===  Qt.Key_3) {
            if (event.isAutoRepeat) return;
            else{
                character[2].moveintputright = true
                changeanim(2,"right")}
        }

        if (event.key ===  Qt.Key_W) {

            if (event.isAutoRepeat) return;
            else
            {
                missile[i]=missilecomponent.createObject(parent, {"x":character[1].x, "y": character[1].y, "img" : "qrc:/Missile/missile1.png"});
                missile[i].p1 = true
                changmissdir(1,i)
                i++
            }
        }
        if (event.key ===  Qt.Key_M) {
            if (event.isAutoRepeat) return;
            else
            {
                missile[i]=missilecomponent.createObject(parent, {"x":character[2].x, "y": character[2].y, "img" : "qrc:/Missile/missile2.png"});
                changmissdir(2,i)
                i++
            }
        }
    }
    Keys.onReleased: {
        if (event.isAutoRepeat) return;

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
        width: 150
        height: 20
        color : "#D8D8D8"
        anchors.top : parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        Row{
            anchors.centerIn: parent
            spacing: 5
            Text{
                color: "#07000d"
                text: "Player 1 "
            }
            Text{
                color: "#07000d"
                text: textscores1.toString()
            }
            Text{
                color: "#07000d"
                text: textscores2.toString()
            }

            Text{
                color: "#07000d"
                text: "Player 2"
            }
        }
    }
    function randomNumber() {
        return Math.random()*(root.width/1.4);
    }

    function getNumber() {
        return game.randomNumber();
    }
    function changeanim(i,input){

        if (input === "left")
        {
            character[i].isMovingDown=false
            character[i].isMovingUp= false
            character[i].isMovingRight = false
            character[i].isMovingLeft = true
        }
        else if (input === "right")
        {
            character[i].isMovingDown=false;
            character[i].isMovingUp= false;
            character[i].isMovingLeft = false;
            character[i].isMovingRight = true;
        }
        else if (input === "up")
        {
            character[i].isMovingDown=false;
            character[i].isMovingLeft = false;
            character[i].isMovingRight = false;
            character[i].isMovingUp= true;
        }
        else if (input === "down")
        {
            character[i].isMovingUp= false;
            character[i].isMovingLeft = false;
            character[i].isMovingRight = false;
            character[i].isMovingDown=true;
        }

    }

    function changmissdir(j,i){

        if(character[j].isMovingRight === true)
        {
            missile[i].movemisright = true
        }
        else if(character[j].isMovingLeft === true)
        {
            missile[i].movemissleft = true
            missile[i].rotation = 180
        }
        else if(character[j].isMovingDown === true)
        {
            missile[i].movemisdown = true
            missile[i].rotation = 90
        }
        else if(character[j].isMovingUp === true)
        {
            missile[i].movemisup = true
            missile[i].rotation = 270
        }
    }
}

