import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0
import QtGraphicalEffects 1.0

import "base.js" as Base
import "js/toolButton_tooltip.js" as Tooltip

ToolButton{
    id : root
    property string tooltipText : ""
    property string tooltipPosition : "up"
    property color defaultBgColor : Base.Color.BlackDark
    style: Style {
        readonly property ToolButton control: __control
        property Component panel: Item {
            id: styleitem
            implicitWidth: 36
            implicitHeight: 36
            property bool _hasToolTipShow : false
            Rectangle {
                anchors.fill: parent
                visible: control.pressed
                gradient: Gradient{
                    GradientStop{color: control.pressed ? Base.Color.White : "white" ; position: 0}
                    GradientStop{color: control.pressed ? Base.Color.WhiteDark : "lightgray" ; position: 1}
                }
                radius:4
                border.color: Base.Color.GreyDark
            }
            Text {
                id: label
                visible: icon.status != Image.Ready
                anchors.centerIn: parent
                text: control.text
            }
            Image {
                id: icon
                anchors.centerIn: parent
                source: control.iconSource
                ColorOverlay {
                    id : overlay
                        anchors.fill: icon
                        source: icon
                        color: control.pressed ? Base.Color.BlackDark : control.hovered ? Base.Color.Primary.Value : defaultBgColor
                    Behavior on color{
                        ColorAnimation { duration: 200 }
                    }
                }

            }
            BorderImage {
                anchors.fill: parent
                anchors.margins: -1
                anchors.topMargin: -2
                anchors.rightMargin: 0
                source: "images/focusframe.png"
                visible: control.activeFocus
                border.left: 4
                border.right: 4
                border.top: 4
                border.bottom: 4
            }
            Timer {
                interval: 1000
                running: control.hovered && !control.pressed && (root.tooltipText.length > 0)
                repeat: true
                onTriggered: {
                    if (!styleitem._hasToolTipShow){
                         Tooltip.show(styleitem,root.tooltipText,root.tooltipPosition)
                        styleitem._hasToolTipShow = true
                    }
//                    console.log("triggered!!!!!")
                }
            }
            states : [
                State{
                    name : "left"
                    when : (!control.hovered) || (control.pressed) || (root.tooltipText.length===0)
                }
            ]
            onStateChanged: {
                if (state==="left"){
//                    console.log("mouse not hovered")
                    Tooltip.close()
                    styleitem._hasToolTipShow = false
                }
            }

        }
    }
}
