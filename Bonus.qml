import QtQuick 2.0


Image {

    id : bonus
    width: 30
    height:30
    source: img
    z:3
    fillMode: Image.Stretch

    property var player1 : game.character[1]
    property var player2 : game.character[2]
    property int range : 20
    property string img

    Timer{

        interval: 3000
        running: true
        repeat: true
        onTriggered: {

            parent.destroy()
        }
    }

    Timer{

        interval: 1
        running: true
        repeat: true
        onTriggered: {

            console.log("XB : " + parent.x + "YB : " + parent.y + "XP : " + player2.x + "YP : " + player2.y)

            if (touchbonus(parent.x,parent.y))
                parent.destroy()
        }
    }

    function touchbonus(x,y){

        if (player1.x < x+range && player1.x > x-range  && player1.y < y+range && player1.y > y-range)
        {
            game.textscores2-=1
            return true
        }

        else if (x < player2.x+range && x > player2.x-range  && y < player2.y+range && y > player2.y-range)
        {
            game.textscores1-=1
            return true
        }
        else return false
    }
}

