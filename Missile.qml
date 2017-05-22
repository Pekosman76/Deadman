import QtQuick 2.0

Image {
    id: mis

    property string img
    property bool movemisright: false
    property bool movemissleft: false
    property var player1 : game.character[1]
    property var player2 : game.character[2]
    property int speedmis : 6

    z:3
    width : 30
    height :30
    source : img
    Timer {
        interval: 1
        running: true
        repeat: true
        onTriggered: {
            if (movemisright==true)
            {
                parent.x+=speedmis

                if ( parent.x <player2.x+20 && parent.x >player2.x-20  && parent.y <player2.y+20 && parent.y >player2.y-20 && game.textscores1!==2)
                {
                    game.textscores1 +=1
                    parent.destroy()
                }
                else if (parent.x <player2.x+20 && parent.x >player2.x-20  && parent.y <player2.y+20 && parent.y >player2.y-20 && game.textscores1===2)
                {
                    game.textscores1 +=1
                    parent.destroy()
                    game.txtw = "Player 1"
                    restart()
                }
            }
            else  if (movemissleft==true)
            {
                parent.x-=speedmis

                if ( parent.x <player1.x+20 && parent.x >player1.x-20  && parent.y <player1.y+20 && parent.y >player1.y-20 && game.textscores2!==2)
                {
                    game.textscores2 +=1
                    parent.destroy()
                }
                else if(parent.x <player1.x+20 && parent.x >player1.x-20  && parent.y <player1.y+20 && parent.y >player1.y-20 && game.textscores2 ===2)
                {
                    game.textscores2 +=1
                    parent.destroy()
                    game.txtw = "Player 2"
                    restart()

                }
            }
        }

        function restart(){
            game.destroycomponent()
            home.visible= true
            home.focus = true
            game.visible =false
            game.focus = false
        }
    }
}
