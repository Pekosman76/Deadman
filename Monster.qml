import QtQuick 2.0

Image {

    id : monster
    width: 100
    height:100
    transformOrigin: Item.Center
    source: img
    z:3
    fillMode: Image.Stretch

    property var player1 : game.character[1]
    property var player2 : game.character[2]
    property int range : 100
    property string img

    Timer{

        interval: 1
        running: true
        repeat: true
        onTriggered: {
            parent.y+=5

            if(game.finish === true)
            {
                parent.destroy()
            }

            else if(parent.y >630 )
            {
                parent.destroy()
            }

            else if (touchmonster(parent.x,parent.y))
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
            game.restart()
            return true
        }

        else if (x < player2.x+range && x > player2.x-range  && y < player2.y+range && y > player2.y-range)
        {
            player2.destroy()
            game.txtw = "Player 1"
            game.restart()
            return true
        }
        else return false
    }

}
