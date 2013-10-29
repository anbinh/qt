import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0
import "base.js" as Base


TabView {
    id:tabview
    width: 500
    height: 200
    tabPosition: 1
    implicitHeight : 300
    implicitWidth : 500
    property color bgColor: "white"
    property color textColor: Base.Color.Black

    style: TabViewStyle {
        id : tabviewstyle
        tabsMovable: true
        tabsAlignment: Qt.AlignRight
        tabOverlap: 4
        frameOverlap: 2
        tab: Item{
            implicitWidth: Math.max(text.width+15,80)
            implicitHeight: 35
            DNARectangleBorder {
                id : theRect
            //    color: styleData.selected ? Base.Color.Primary.Value : tabview.bgColor
                border.width: styleData.selected ? 2 : 0
            //    border.color: Base.Color.Primary.Value
                border.color: styleData.selected ? Base.Color.Grey : "transparent"
                implicitWidth: parent.implicitWidth
                implicitHeight: parent.implicitHeight
                hasTopLeftRadius : true
                hasTopRightRadius : true
                hasBottomLeftRadius : false
                hasBottomRightRadius : false
                bgColor : styleData.selected ? tabview.bgColor : "transparent"
                radius: 4
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: styleData.title
                    color: styleData.selected ? Base.Color.Primary.Value : tabview.textColor
                    font.bold: true
                }
                Rectangle {
                    color : parent.bgColor
                    width: parent.width-parent.border.width*2
                    height: parent.border.width
                    x : parent.border.width
                    y : parent.height-parent.border.width

                }
                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.NoButton
                    cursorShape: styleData.selected ? Qt.ArrowCursor : Qt.PointingHandCursor
                    hoverEnabled: true
                }

                states: [
                    State {
                        name: "hovered"
                        when : styleData.hovered
                        PropertyChanges {target: text;color: Base.Color.Primary.Value}
                    }

                ]
                transitions: Transition {
                                PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                            }
           }
        }

        frame: Rectangle {
            implicitHeight: tabview.height
            implicitWidth: tabview.width
            color: tabview.bgColor
            border.color: Base.Color.Grey
            border.width: 2
        }
    }
    MouseArea { cursorShape: Qt.ArrowCursor; anchors.fill: parent }


}
