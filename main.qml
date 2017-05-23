import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {

    id : root
    visible: true
    width: 640
    height:480

    Game{

        id : game
        width: 640
        height: 480
        visible: false
        focus : false
    }
    Home{

        id : home
        width: 640
        height: 480
        visible: true
        focus : true

    }
}

