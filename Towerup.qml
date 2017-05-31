import QtQuick 2.0

Image {

    id: mis
    z:3
    width : 30
    height :30
    source : img
    transformOrigin: Item.Center

    property string img
    property bool moveright : false
    property bool moveleft :false
    property int speed :  2

    Timer {

        interval: 5000
        running: true
        repeat: true
        onTriggered: {

            game.missile[game.i]= game.missilecomponent.createObject(game, {"x":parent.x, "y": parent.y, "img" : "qrc:/Missile/missile2.png"});
            game.missile[game.i].movemisup = true
            game.missile[game.i].rotation = 270
            game.i+=1

        }
    }
    Timer {
        interval: 20;
        running: moveright;
        repeat: true
        onTriggered: {
            if ( parent.x > (game.width-30))
            {
                parent.x=(game.width-30)
                moveleft = true
                moveright = false
            }
            else
                parent.x+=speed;
        }
    }
    Timer {
        interval: 20;
        running: moveleft;
        repeat: true
        onTriggered: {
            if ( parent.x<0)
            {
                parent.x=0
                moveright = true
                moveleft = false
            }
            else
                parent.x-=speed;
        }
    }
}
