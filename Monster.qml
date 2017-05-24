import QtQuick 2.0

Image {

    id : monster
    width: 150
    height:150
    //transformOrigin: Item.Center
    source: img
    z:3
    fillMode: Image.Stretch

    property var player1 : game.character[1]
    property var player2 : game.character[2]
    property int range : 150
    property string img

    Timer{

        interval: 1
        running: true
        repeat: true
        onTriggered: {
            console.log(parent.y)

            parent.y+=5

            if(parent.y >630 )
            {
                parent.destroy()
            }

            if (touchmonster(parent.x,parent.y))
            {
                parent.destroy()
            }
        }
    }

    function touchmonster(x,y){

        if (player1.x < x+range && player1.x > x-range  && player1.y < y+range && player1.y > y-range)
        {
            player1.destroy()
            game.txtw = "Player 2"
            restart()
            return true
        }

        else if (x < player2.x+range && x > player2.x-range  && y < player2.y+range && y > player2.y-range)
        {
            player2.destroy()
            game.txtw = "Player 1"
            restart()
            return true
        }
        else return false
    }

    function restart(){
        game.destroycomponent()
        home.visible= true
        home.focus = true
        game.visible =false
        game.focus = false
    }
}
