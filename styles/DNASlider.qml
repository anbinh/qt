import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "base.js" as Base
Slider {
    id : sld
    width : 200
    height : 6
    maximumValue: 100
    minimumValue: 0
    property int sliderHeight : 6
    property int handleWidth : 20
    property int handleHeight : 20
    property int handleRadius : 10

    style: SliderStyle {
        groove: Rectangle {
            id : theRect
            implicitWidth: sld.width
            implicitHeight: sliderHeight
            color: Base.Color.Disabled.Value
            radius: sliderHeight/2
            Rectangle {
                id : completeRect
                 implicitWidth: styleData.handlePosition
                 implicitHeight: sliderHeight
                 color: Base.Color.Primary.Value
                 radius: sliderHeight/2
//                 Behavior on implicitWidth {
//                         PropertyAnimation { duration: 100; easing.type : Easing.OutQuad  }
//                     }
            }
            states: [
                State {
                    name: "clickState"
                    when : sld.pressed
                    PropertyChanges { target: completeRect; color: Base.Color.Primary.Dark}
                },
                State {
                    name: "hoverState"
                    when : sld.hovered
                    PropertyChanges { target: completeRect; color: Base.Color.Primary.Light}
                }

            ]
            transitions: [
                Transition {
                    to : "clickState"
                    PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                },
                Transition {
                    to : "hoverState"
                    PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                }
            ]
        }
        handle: Rectangle {
            id : handleItem
            anchors.centerIn: parent
            color: sld.hovered ? sld.pressed ? Base.Color.Primary.Dark : Base.Color.Primary.Light : Base.Color.Primary.Value
            width: sld.handleWidth
            height: sld.handleHeight
            radius: sld.handleRadius
            MouseArea { cursorShape: Qt.PointingHandCursor; acceptedButtons: Qt.NoButton;anchors.fill: parent }
            states: [
                State {
                    name: "clickState"
                    when : sld.pressed
                    PropertyChanges { target: handleItem; color: Base.Color.Primary.Dark}
                },
                State {
                    name: "hoverState"
                    when : sld.hovered
                    PropertyChanges { target: handleItem; color: Base.Color.Primary.Light}
                }

            ]
            transitions: [
                Transition {
                    to : "clickState"
                    PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                },
                Transition {
                    to : "hoverState"
                    PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                }
            ]
        }

    }
}
