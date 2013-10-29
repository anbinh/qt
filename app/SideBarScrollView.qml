import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0
import "../styles/base.js" as Base

ScrollView {
    id : scrollview
   property int scrollbarWidth : 8
//    property bool handleHovered : false
   frameVisible : true
   __verticalScrollBar.visible : ((behaviours.containsMouse)||(scrollview.activeFocus)) ? true : false
   __horizontalScrollBar.visible : false
   style : ScrollViewStyle{
       scrollBarBackground : Item {
           implicitWidth: scrollview.scrollbarWidth
           implicitHeight: scrollview.scrollbarWidth
           visible : true
           Rectangle {
               anchors.fill: parent
               color: "transparent"
               border.color: "transparent"
               anchors.rightMargin: styleData.horizontal ? -2 : -1
               anchors.leftMargin: styleData.horizontal ? -2 : 0
               anchors.topMargin: styleData.horizontal ? 0 : -2
               anchors.bottomMargin: styleData.horizontal ? -1 : -2
           }

       }
       handle: Rectangle{
               id : theRect
               opacity: 0.8
               implicitWidth: styleData.horizontal ? 66 : scrollview.scrollbarWidth
               implicitHeight: styleData.horizontal ? scrollview.scrollbarWidth : 66
               color : Base.Color.Grey
               radius : scrollview.scrollbarWidth
               border.width: 1
               border.color: Base.Color.GreyDark
               states: [
                   State {
                       name: "clicked"
                       when : styleData.pressed
                       PropertyChanges {target: theRect; opacity : 1}
                   }
               ]
               transitions: Transition {
                       PropertyAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 500 }
               }
//               MouseArea{
//                   anchors.fill : parent
//                   hoverEnabled: true
//                   onEntered: {
//                       scrollview.handleHovered = true;
//                   }
//                   onExited: {
//                       scrollview.handleHovered = false;
//                   }
//               }
           }
       incrementControl: Rectangle {
               visible : false
               implicitWidth: 0
               implicitHeight: 0
               color : "blue"
           }
       decrementControl: Rectangle {
                visible : false
               implicitWidth: 0
               implicitHeight: 0
               color : "blue"
           }
       corner: Rectangle { color: "transparent";visible : false }

   }
   MouseArea{
       id : behaviours
       anchors.fill : parent
       hoverEnabled: true
       acceptedButtons: Qt.NoButton;


       onEntered: {
           scrollview.__verticalScrollBar.visible = true;
       }
       onExited: {
           if (((scrollview.width-mouseX)<=scrollview.scrollbarWidth*2) || (Math.abs(scrollview.height-mouseY)<=scrollview.scrollbarWidth*2)){
               // do nothing
           } else {
                          scrollview.__verticalScrollBar.visible = false;
           }



       }
       Timer {
           interval: 1000
           running: !behaviours.containsMouse
           repeat: true
           onTriggered:{
               scrollview.__verticalScrollBar.visible = false;
           }

       }

   }
}


