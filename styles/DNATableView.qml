import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0
import "base.js" as Base


TableView {
    id : tableview
   property int scrollbarWidth : 8
   frameVisible : false
   __verticalScrollBar.visible : false
   __horizontalScrollBar.visible : false
   style : TableViewStyle{
       backgroundColor : Base.Color.Disabled.Value
       highlightedTextColor : "red"
       itemDelegate : Rectangle{
           implicitHeight: 35
           color : "transparent"
           border.width : 1
           border.color : styleData.selected ? "transparent" : Qt.lighter(Base.Color.Disabled.Light,1.2)
           Label {
               id : parentLabel
               anchors.verticalCenter: parent.verticalCenter
               anchors.left: parent.left
               anchors.leftMargin: 5
               color: Base.Color.BlackDark
               elide: styleData.elideMode
               text: styleData.value
               horizontalAlignment: styleData.textAlignment
               states: [
                   State {
                       name: "selected"
                       when : styleData.selected
                       PropertyChanges {target: parentLabel; color : Base.Color.White}
                   }
               ]
               transitions: Transition {
                       PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
               }
           }

       }
       rowDelegate: StyleItem {

           elementType: "itemrow"
           activeControl: styleData.alternate ? "alternate" : ""
           selected: styleData.selected ? true : false
           height: Math.max(35, rowstyle.implicitHeight)
           active: styleData.hasActiveFocus
           Rectangle{
               id: rowstyle
               height: Math.max(35, rowstyle.implicitHeight)
               anchors.fill: parent
               implicitHeight: rowstyle.implicitHeight
               color : styleData.alternate ? "white" : Base.Color.White
               opacity : 1
               states: [
                   State {
                       name: "selected"
                       when : styleData.selected
                       PropertyChanges {target: rowstyle; color : Base.Color.Primary.Light}
                   }
               ]
               transitions: Transition {
                       PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                       SequentialAnimation {
                           loops: Animation.Infinite
                           PropertyAnimation { target:rowstyle; properties: "opacity"; to : 0.8; easing.type: Easing.InOutQuad;duration: 1000}
                            PropertyAnimation { target:rowstyle; properties: "opacity"; to : 1; easing.type: Easing.InOutQuad;duration: 1000}
                       }
               }
           }
       }
       headerDelegate: Rectangle{
           implicitHeight: 35
           color : "white"
           border.width : 1
           border.color : styleData.selected ? "white" : Qt.lighter(Base.Color.Disabled.Light,1.2)
           Label {
               anchors.verticalCenter: parent.verticalCenter
               anchors.left: parent.left
               anchors.leftMargin: 5
               color: styleData.selected ? Base.Color.White : Base.Color.BlackDark
               text: styleData.value
               font.bold: true
           }
       }
       scrollBarBackground : Item {
           implicitWidth: tableview.scrollbarWidth
           implicitHeight: tableview.scrollbarWidth
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
               implicitWidth: styleData.horizontal ? 66 : tableview.scrollbarWidth
               implicitHeight: styleData.horizontal ? tableview.scrollbarWidth : 66
               color : Base.Color.Grey
               radius : tableview.scrollbarWidth
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
               MouseArea{
                   anchors.fill : parent
                   hoverEnabled: true
//                           onEntered: {
//                               tableview.__verticalScrollBar.visible = true;
//                           }
               }
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
       anchors.fill : parent
       hoverEnabled: true
       acceptedButtons: Qt.NoButton;
       onEntered: {
           tableview.__verticalScrollBar.visible = true;
           tableview.__horizontalScrollBar.visible = true;
       }
       onExited: {
           tableview.__verticalScrollBar.visible = false;
           tableview.__horizontalScrollBar.visible = false;
       }

   }
}

