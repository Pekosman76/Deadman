import QtQuick 2.0

Item {

    width: parent.width
    height: parent.height
    focus  : true

    property var charactercomponent :Qt.createComponent("Character.qml")
    property var missilecomponent :Qt.createComponent("Missile.qml")
    property var bonuscomponent : Qt.createComponent("Bonus.qml")
    property var monstercomponent : Qt.createComponent("Monster.qml")
    property var towerleftcomponent : Qt.createComponent("Towerleft.qml")
    property var towerrightcomponent : Qt.createComponent("Towerright.qml")
    property var towerupcomponent : Qt.createComponent("Towerup.qml")
    property var towerdowncomponent : Qt.createComponent("Towerdown.qml")

    property var character :[]
    property var missile :[]
    property var bonus : []
    property var monster : []
    property var towerleft :[]
    property var towerup : []
    property var towerright : []
    property var towerdown : []

    property int i :1
    property int textscores1 : 0
    property int textscores2 : 0
    property string txtw : "Player"

    property bool finish : false

    function creatcomponent(){
        finish = false

        character[1]=charactercomponent.createObject(parent, {"x":0, "y": game.height/2, "img": "qrc:/character/robot1.png", "isMovingRight" : true});
        character[2]=charactercomponent.createObject(parent, {"x":((game.width)-50), "y": game.height/2, "img": "qrc:/character/robot2.png", "isMovingLeft" : true});

        towerright[1] = towerrightcomponent.createObject(parent, {"x":0, "y": 120, "img": "qrc:/Ship/shipblue.png", "rotation": 90});
        towerleft[1] = towerleftcomponent.createObject(parent, {"x":610, "y": 360, "img": "qrc:/Ship/shipred.png", "rotation" : 270});
        towerdown[1] = towerdowncomponent.createObject(parent, {"x":480, "y": 0, "img": "qrc:/Ship/shipblue.png", "rotation" : 180});
        towerup[1] = towerupcomponent.createObject(parent, {"x":160, "y": 450, "img": "qrc:/Ship/shipred.png"});


        textscores1 = 0
        textscores2 = 0
        bonustimer.restart()
        montsertimer.restart()
        i=1
    }


    Timer{

        id : bonustimer
        interval: 8000
        repeat: true
        running: false
        onTriggered: {

            bonus[1]= bonuscomponent.createObject(parent,{"x" : getNumber(), "y" : getNumber(), "img" :"qrc:/Bonus/Heart.png"})
        }
    }

    Timer{

        id : montsertimer
        interval: 16000
        repeat: true
        running: false
        onTriggered: {

            monster[1]= monstercomponent.createObject(parent,{"x" : getNumber(), "y" : 0, "img" :"qrc:/Munster/ronflex.png"})
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

    Scores{

        anchors.top : parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        scorep1: textscores1.toString()
        scorep2: textscores2.toString()

    }
    function randomNumber() {
        return Math.random()*(root.width/1.4);
    }

    function getNumber() {
        return game.randomNumber();
    }
    function changeanim(indexcharacter,input){

        if (input === "left")
        {
            character[indexcharacter].isMovingDown=false
            character[indexcharacter].isMovingUp= false
            character[indexcharacter].isMovingRight = false
            character[indexcharacter].isMovingLeft = true
        }
        else if (input === "right")
        {
            character[indexcharacter].isMovingDown=false;
            character[indexcharacter].isMovingUp= false;
            character[indexcharacter].isMovingLeft = false;
            character[indexcharacter].isMovingRight = true;
        }
        else if (input === "up")
        {
            character[indexcharacter].isMovingDown=false;
            character[indexcharacter].isMovingLeft = false;
            character[indexcharacter].isMovingRight = false;
            character[indexcharacter].isMovingUp= true;
        }
        else if (input === "down")
        {
            character[indexcharacter].isMovingUp= false;
            character[indexcharacter].isMovingLeft = false;
            character[indexcharacter].isMovingRight = false;
            character[indexcharacter].isMovingDown=true;
        }

    }

    function changmissdir(indexcharacter,indexmissile){

        if(character[indexcharacter].isMovingRight === true)
        {
            missile[indexmissile].movemisright = true
        }
        else if(character[indexcharacter].isMovingLeft === true)
        {
            missile[indexmissile].movemissleft = true
            missile[indexmissile].rotation = 180
        }
        else if(character[indexcharacter].isMovingDown === true)
        {
            missile[indexmissile].movemisdown = true
            missile[indexmissile].rotation = 90
        }
        else if(character[indexcharacter].isMovingUp === true)
        {
            missile[indexmissile].movemisup = true
            missile[indexmissile].rotation = 270
        }
    }

    function restart(){

        finish = true
        character[1].destroy()
        character[2].destroy()

        towerright[1].destroy()
        towerleft[1].destroy()
        towerdown[1].destroy()
        towerup[1].destroy()

        home.winner = txtw
        bonustimer.stop()
        montsertimer.stop()

        home.visible= true
        home.focus = true
        game.visible =false
        game.focus = false
    }
}

