import QtQuick 2.1
import QtQuick.Controls 1.0
import "base.js" as Base

Item{
    id : root
    width: 150
    height: tpTxt.height + 20
    property string text : "Hello! I am your tooltip. This is extra info."
    property string style : "right"
    property color bgColor : Base.Color.Background.Dark
    property color textColor: Base.Color.White
    property int textLeftRightMargin : 20
    property int pointerSize : 10
    property  int fontFixelSize : 10
    property bool multiLinesMode : true
    // draw triangle pointer
    Rectangle{
        id : pointer
        width : parent.pointerSize
        height : parent.pointerSize
        x : parent.width/2
        y : -mainbox.radius-1
        opacity : parent.opacity
        rotation : 45
        color : root.bgColor

    }

    // draw main box
    Rectangle{
        id : mainbox
        anchors.fill: parent
        color : root.bgColor
        opacity : parent.opacity
        radius : 4
        // text
        Label{
            id : tpTxt
            text : root.text
            anchors.centerIn: parent
            opacity : parent.opacity
            width: multiLinesMode ? (parent.width - root.textLeftRightMargin*2) : parent.width
            wrapMode: multiLinesMode ? Text.Wrap : Text.NoWrap
            color : root.textColor
            font.pixelSize: root.fontFixelSize
            font.family: Base.Font.family
            horizontalAlignment: Text.AlignHCenter
    //        Rectangle{
    //            width: parent.width
    //            height : parent.height
    //            color : "red"
    //            opacity : 0.6
    //        }
        }
    }




    states : [
        State{
            name : "left"
            when : (root.style==="left")
            PropertyChanges{target:pointer;x:-pointer.width/2;y:root.height/2-pointer.height/2}
        },
        State{
            name : "right"
            when : (root.style==="right")
            PropertyChanges{target:pointer;x:mainbox.width-pointer.width/2;y:root.height/2-pointer.height/2}
        },
        State{
            name : "up"
            when : (root.style==="up")
            PropertyChanges{target:pointer;x:parent.width/2-pointer.width/2;y:-pointer.height/2}
        },
        State{
            name : "down"
            when : (root.style==="down")
            PropertyChanges{target:pointer;x:parent.width/2-pointer.width/2;y:root.height-pointer.height/2}
        }

    ]

}
