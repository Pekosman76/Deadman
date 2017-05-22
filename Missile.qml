import QtQuick 2.0

Image {
    id: mis

    property string img
    property bool moveinputright: false
    property bool moveinputleft: false

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

                if ( parent.x <game.character[2].x+20 && parent.x >game.character[2].x-20  && parent.y <game.character[2].y+20 && parent.y >game.character[2].y-20 && game.textscores1!==2)
                {
                    game.textscores1 +=1
                    parent.destroy()
                }
                else if (parent.x <game.character[2].x+20 && parent.x >game.character[2].x-20  && parent.y <game.character[2].y+20 && parent.y >game.character[2].y-20 && game.textscores1===2)
                {
                    game.textscores1 +=1
                    game.character[2].destroy()
                    parent.destroy()
                    home.visible= true
                    home.focus = true
                    game.visible =false
                    game.focus = false
                }
            }
            else  if (moveinputleft==true)
            {
                parent.x-=5
                if ( parent.x <game.character[1].x+20 && parent.x >game.character[1].x-20  && parent.y <game.character[1].y+20 && parent.y >game.character[1].y-20 && game.textscores2!==2)
                {
                    game.textscores2 +=1
                    parent.destroy()
                }
                else if(parent.x <game.character[1].x+20 && parent.x >game.character[1].x-20  && parent.y <game.character[1].y+20 && parent.y >game.character[1].y-20 && game.textscores2 ===2)
                {
                    game.textscores2 +=1
                    game.character[1].destroy()
                    parent.destroy()
                    home.visible= true
                    home.focus = true
                    game.visible =false
                    game.focus = false
                }
            }
        }
    }
}



