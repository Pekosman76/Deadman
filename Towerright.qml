import QtQuick 2.0

Image {

    id: mis
    z:3
    width : 30
    height :30
    source : img
    transformOrigin: Item.Center

    property string img

    Timer {

        interval: 5000
        running: true
        repeat: true
        onTriggered: {

            game.missile[game.i]= game.missilecomponent.createObject(game, {"x":parent.x, "y": parent.y, "img" : "qrc:/Missile/missile1.png"});
            game.missile[game.i].p1 = true
            game.missile[game.i].movemisright = true
            game.i+=1

        }
    }
}
