import QtQuick 2.0

Image {

    id: mis
    z:3
    width : 30
    height :30
    source : img
    transformOrigin: Item.Center

    property string img
    property bool movemisright: false
    property bool movemissleft: false
    property bool movemisup: false
    property bool movemisdown: false

    property var player1 : game.character[1]
    property var player2 : game.character[2]

    property bool p1 : false
    property int range : 20
    property int speedmis : 6

    Timer {

        interval: 15
        running: true
        repeat: true
        onTriggered: {

            if(game.finish === true)
            {
                parent.destroy()
            }

            else if (movemisright==true)
            {
                parent.x+=speedmis

                if(p1===true)
                    touchmissileP2()
                else
                    touchmissileP1()
            }
            else  if (movemissleft==true)
            {
                parent.x-=speedmis

                if(p1===true)
                    touchmissileP2()
                else
                    touchmissileP1()

            }
            else  if (movemisup==true)
            {
                parent.y-=speedmis

                if(p1===true)
                    touchmissileP2()
                else
                    touchmissileP1()

            }
            else  if (movemisdown==true)
            {
                parent.y+=speedmis

                if(p1===true)
                    touchmissileP2()
                else
                    touchmissileP1()
            }
        }

        function touchmissileP1(){

            if (parent.x <player1.x+range && parent.x >player1.x-range  && parent.y <player1.y+range && parent.y >player1.y-range && game.textscores2!==2)
            {
                game.textscores2 +=1
                parent.destroy()
            }


            else if(parent.x <player1.x+range && parent.x >player1.x-range  && parent.y <player1.y+range && parent.y >player1.y-range && game.textscores2===2)
            {
                game.textscores2 +=1
                parent.destroy()
                game.txtw = "Player 2"
                game.restart()

            }

        }

        function touchmissileP2(){

            if (parent.x <player2.x+range && parent.x >player2.x-range  && parent.y <player2.y+range && parent.y >player2.y-range && game.textscores1!==2)
            {
                game.textscores1 +=1
                parent.destroy()
            }
            else if (parent.x <player2.x+range && parent.x >player2.x-range  && parent.y <player2.y+range && parent.y >player2.y-range && game.textscores1===2)
            {
                game.textscores1 +=1
                parent.destroy()
                game.txtw = "Player 1"
                game.restart()
            }
        }


    }
}
