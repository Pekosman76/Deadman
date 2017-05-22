import QtQuick 2.0

Text{


    id: labelscore;
    color: "#07000d"
    text: parent.textscores.toString()
    focus: true;
    textFormat: Text.PlainText;
    fontSizeMode: Text.Fit;
    minimumPixelSize: 10;
    verticalAlignment: Text.AlignVCenter;
    horizontalAlignment: Text.AlignHCenter;

}

