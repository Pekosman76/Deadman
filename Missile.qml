import QtQuick 2.0

Image {
    id: mis

    property string img
    property bool moveinputright: false
    property bool moveinputleft: false
    property var player1 : game.character[1]
    property var player2 : game.character[2]

    z:3
    width : 30
    height :30
    source : img
    Timer {
        interval: 1
        running: true
        repeat: true
        onTriggered: {
            if (moveinputright==true)
            {
                parent.x+=5

                if ( parent.x <player2.x+20 && parent.x >player2.x-20  && parent.y <player2.y+20 && parent.y >player2.y-20 && game.textscores1!==2)
                {
                    game.textscores1 +=1
                    parent.destroy()
                }
                else if (parent.x <player2.x+20 && parent.x >player2.x-20  && parent.y <player2.y+20 && parent.y >player2.y-20 && game.textscores1===2)
                {
                    game.textscores1 +=1
                    player2.destroy()
                    parent.destroy()
                    restart()
                }
            }
            else  if (moveinputleft==true)
            {
                parent.x-=5

                if ( parent.x <player1.x+20 && parent.x >player1.x-20  && parent.y <player1.y+20 && parent.y >player1.y-20 && game.textscores2!==2)
                {
                    game.textscores2 +=1
                    parent.destroy()
                }
                else if(parent.x <player1.x+20 && parent.x >player1.x-20  && parent.y <player1.y+20 && parent.y >player1.y-20 && game.textscores2 ===2)
                {
                    game.textscores2 +=1
                    player1.destroy()
                    parent.destroy()
                    restart()

                }
            }

        }

        function restart(){
            home.visible= true
            home.focus = true
            game.visible =false
            game.focus = false
            game.destroycomponent()
        }
    }
}
