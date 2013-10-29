import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0
import "base.js" as Base

SpinBox {
    id: spinbox
    maximumValue : 100
    minimumValue : 0
    stepSize : 1
    activeFocusOnPress : true
    height : 30
    enabled : (type=="Disabled") ? false : true
    implicitWidth : spinboxWidth
    property string type : "Default"
    property color bgColor : Base.Color.Grey
    property color bgColorLight : Base.Color.GreyLight
    property color bgColorDark : Base.Color.GreyDark
    property color textColor : Base.Color.White
    property int radius : 4
    property int spinboxWidth : 100
    font.family : Base.Font.family
    function changeColor(itm,isUp){
        if (itm.type == "Custom") {
            if (isUp){
                return itm.upHovered ? itm.upPressed ? itm.bgColorDark : itm.bgColorLight : itm.bgColor;
            } else {
                return itm.downHovered ? itm.downPressed ? itm.bgColorDark : itm.bgColorLight : itm.bgColor;
            }


        } else
            if (itm.type == "Disabled"){
                spinbox.enabled = false;
                return Base.Color[type].Dark;
            } else
                if (isUp){
                    return itm.upHovered ? itm.upPressed ? Base.Color[type].Dark : Base.Color[type].Light : Base.Color[type].Value;
                } else {
                    return itm.downHovered ? itm.downPressed ? Base.Color[type].Dark : Base.Color[type].Light : Base.Color[type].Value;
                }


    }


    style : SpinBoxStyle{
        id : spinboxStyle
           textColor : Base.Color.BlackDark
           selectionColor : Base.Color[type].Value
           selectedTextColor : Base.Color.White
           background: Rectangle {
                   implicitHeight: spinbox.implicitHeight
                   implicitWidth: spinbox.implicitWidth
                   color : "transparent"

                   Rectangle{
                       id : rec1
                       implicitWidth: parent.width - 24
                       implicitHeight: parent.height
                       border.color: {
                           if ((styleData.upHovered==true) || (styleData.downHovered==true) || (spinbox.activeFocus)){
                               return Base.Color[type].Value
                           } else return Base.Color.Disabled.Value
                       }

                       border.width: 2
                       radius : spinbox.radius
                       color : spinbox.enabled ? "white" : Qt.lighter(Base.Color.Disabled.Value,1.2)
                       MouseArea { cursorShape: Qt.IBeamCursor; anchors.fill: parent }

                   }
                   Rectangle{
                       id : rec2
                       anchors.left: rec1.right
                       implicitWidth: 4
                       implicitHeight: parent.height
                       color : "transparent"
                   }
                   Rectangle{
                       anchors.left: rec2.right
                       implicitWidth: parent.width - rec1.width - rec2.width
                       implicitHeight: parent.height
                       color : "transparent"
                       radius : spinbox.radius
                   }


               }

           incrementControl: Rectangle {
               implicitWidth: 20
               Image {
                   source: "images/arrow-up.png"
                   anchors.centerIn: parent
                   anchors.verticalCenterOffset: 1
                   opacity: styleData.upHovered ? 1 : 0.7

                   anchors.horizontalCenterOffset:  0
               }
               color : Qt.lighter(spinbox.changeColor(styleData,true),1.1)
               radius : spinbox.radius
               Rectangle {
                   color : Qt.lighter(spinbox.changeColor(styleData,true),1.1)
                   anchors.bottom : parent.bottom
                   implicitHeight: spinbox.radius
                   implicitWidth: parent.implicitWidth
               }

               MouseArea {
                   cursorShape: Qt.PointingHandCursor;
                   anchors.fill: parent
               }



           }
           decrementControl: Rectangle {
               implicitWidth: 20
               Image {
                   source: "images/arrow-down.png"
                   anchors.centerIn: parent
                   anchors.verticalCenterOffset: -2
                   anchors.horizontalCenterOffset:  0
                   opacity: styleData.downHovered ? 1 : 0.7
               }
               color : spinbox.changeColor(styleData,false)
               radius : spinbox.radius
               Rectangle {
                   color : spinbox.changeColor(styleData,false)
                   anchors.top : parent.top
                   implicitHeight: spinbox.radius
                   implicitWidth: parent.implicitWidth
               }
               MouseArea {
                   cursorShape: Qt.PointingHandCursor;
                   anchors.fill: parent
               }
           }

    }

}


