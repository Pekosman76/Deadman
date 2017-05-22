import QtQuick 2.0

Image {
    id: player
    width : 30
    height :30

    property string img
    property bool moveinputdown: false
    property bool moveinputup: false
    property bool moveintputright : false
    property bool moveinputleft :false
    property bool isMovingRight :false;
    property bool isMovingLeft :false;
    property int speed : 5

    AnimatedSprite {
        id:sprite_right
        transformOrigin: Item.TopLeft

        visible: true
        anchors.centerIn: parent
        width: 30
        height: 30

        source : img
        frameWidth: 32
        frameHeight: 32
        frameCount: 3
        frameX : 0
        frameY : 64
        frameDuration: 200
        loops: Animation.Infinite
        running: true
        interpolate:false;
    }
    AnimatedSprite {
        id:sprite_left
        transformOrigin: Item.TopLeft

        visible: isMovingLeft
        anchors.centerIn: parent
        width: 30
        height: 30

        source : img
        frameWidth: 32
        frameHeight: 32
        frameCount: 3
        frameX : 0
        frameY : 32
        frameDuration: 200
        loops: Animation.Infinite
        running: isMovingLeft
        interpolate:false;
    }
    Timer {
        interval: 1;
        running: moveinputdown;
        repeat: true
        onTriggered: {
            if ( parent.y > (game.height-30))
                parent.y=(game.height-30)
            else

                parent.y+=speed;
        }
    }
    Timer {
        interval: 1;
        running: moveinputup;
        repeat: true
        onTriggered: {
            if ( parent.y<0)
                parent.y=0
            else
                parent.y-=speed;
        }
    }
    Timer {
        interval: 1;
        running: moveintputright;
        repeat: true
        onTriggered: {
            if ( parent.x > (game.width-30))
                parent.x=(game.width-30)
            else
                parent.x+=speed;
        }
    }
    Timer {
        interval: 1;
        running: moveinputleft;
        repeat: true
        onTriggered: {
            if ( parent.x<0)
                parent.x=0
            else
                parent.x-=speed;
        }
    }
}

