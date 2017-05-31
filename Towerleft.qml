import QtQuick 2.0

Image {

    id: mis
    z:3
    width : 30
    height :30
    source : img
    transformOrigin: Item.Center

    property string img
    property bool moveup : false
    property bool movedown :false
    property int speed :  2

    Timer {

        interval: 5000
        running: true
        repeat: true
        onTriggered: {

            game.missile[game.i]= game.missilecomponent.createObject(game, {"x":parent.x, "y": parent.y, "img" : "qrc:/Missile/missile2.png"});
            game.missile[game.i].movemissleft = true
            game.missile[game.i].rotation = 180
            game.i+=1

        }
    }

    Timer {
        interval: 20;
        running: movedown;
        repeat: true
        onTriggered: {
            if ( parent.y > (game.height-30))
            {
                parent.y=(game.height-30)
                moveup = true
                movedown = false
            }
            else
                parent.y+=speed;
        }
    }
    Timer {
        interval: 20;
        running: moveup;
        repeat: true
        onTriggered: {
            if ( parent.y<0)
            {
                parent.y=0
                movedown = true
                moveup = false
            }
            else
                parent.y-=speed;
        }
    }
}
