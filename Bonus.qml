import QtQuick 2.0


Image {

    //property string img

    id : bonus
    width: 30
    height:30
    source: "Bonus/Star.png"
    y:0
    z:2

    property var player1 : game.character[1]
    property var player2 : game.character[2]

    fillMode: Image.Stretch

    Timer{

        interval: 1
        running: true
        repeat: true
        onTriggered: {
            parent.y+=3
            if (parent.y>480)
            {
                parent.destroy()
            }

            if ( parent.x <player1.x+20 && parent.x >player1.x-20  && parent.y <player1.y+20 && parent.y >player1.y-20)
            {
                //console.log("touchééééééééééééééééééééééééé")
            }

        }
    }
}

