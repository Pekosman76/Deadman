import QtQuick 2.0

Image {
    id: player
    width : 50
    height :50

    property string img
    property bool moveinputdown: false
    property bool moveinputup: false
    property bool moveintputright : false
    property bool moveinputleft :false
    property bool isMovingRight :false;
    property bool isMovingLeft :false;
    property bool isMovingUp :false;
    property bool isMovingDown :false;
    property int speed : 4

    AnimatedSprite {
        id:sprite_right
        transformOrigin: Item.TopLeft

        visible: isMovingRight
        anchors.centerIn: parent
        anchors.fill: parent
        source : img
        frameWidth: 64
        frameHeight: 64
        frameCount: 3
        frameX : 0
        frameY : 128
        frameDuration: 200
        loops: Animation.Infinite
        running: isMovingRight
        interpolate:false;
    }
    AnimatedSprite {
        id:sprite_left
        transformOrigin: Item.TopLeft

        visible: isMovingLeft
        anchors.fill: parent

        source : img
        frameWidth: 64
        frameHeight: 64
        frameCount: 3
        frameX : 0
        frameY : 64
        frameDuration: 200
        loops: Animation.Infinite
        running: isMovingLeft
        interpolate:false;
    }
    AnimatedSprite {
        id:sprite_up
        transformOrigin: Item.TopLeft

        visible: isMovingUp
        anchors.fill: parent

        source : img
        frameWidth: 64
        frameHeight: 64
        frameCount: 3
        frameX : 0
        frameY : 0
        frameDuration: 200
        loops: Animation.Infinite
        running: isMovingUp
        interpolate:false;
    }
    AnimatedSprite {
        id:sprite_down
        transformOrigin: Item.TopLeft

        visible: isMovingDown
        anchors.fill: parent

        source : img
        frameWidth: 64
        frameHeight: 64
        frameCount: 3
        frameX : 0
        frameY : 192
        frameDuration: 200
        loops: Animation.Infinite
        running: isMovingDown
        interpolate:false;
    }
    Timer {
        interval: 1;
        running: moveinputdown;
        repeat: true
        onTriggered: {
            if ( parent.y > (game.height-50))
                parent.y=(game.height-50)
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
            if ( parent.x > (game.width-50))
                parent.x=(game.width-50)
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

