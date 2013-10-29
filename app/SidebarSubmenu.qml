import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0


import "../styles/base.js" as Base

Rectangle{
    id : root
    width: 200
    height:section.height + children.height + section.anchors.topMargin + children.anchors.topMargin
    property alias sectionText : section.text
    property alias model : repeater.model
    property Component delegate
    property alias source: section.source
    property int _childrenHeightBackup
    property bool isCollapsed : false

    SectionTitle{
        id : section
        anchors.top : parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        text : "Main"

    }

    Image{
        id : collapse
        source : root.isCollapsed ? "images/arrow-down.png" : "images/arrow-up.png"
        anchors.right : parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: section.verticalCenter
        anchors.verticalCenterOffset: 1
        scale : 1
        ColorOverlay {
            id : overlay
            anchors.fill: collapse
            source: collapse
            color: imgMouse.containsMouse ? Base.Color.Blue : Base.Color.Black
            Behavior on color{
                ColorAnimation { duration: 200 }
            }
        }
        MouseArea{
            id : imgMouse
            anchors.fill : parent
            cursorShape: Qt.PointingHandCursor
            anchors.margins: -5 // make mousearea larger
            onClicked: {
                if (children.height > 0){
                    root._childrenHeightBackup = children.height
                    children.height = 0
                    children.anchors.topMargin = 10
                    children.opacity = 0
                    root.isCollapsed = true
                }
                else {
                    children.height = root._childrenHeightBackup
                    children.anchors.topMargin = 20
                    children.opacity = 1
                    root.isCollapsed = false
                }
            }
        }

    }
    Column{
        id : children
        anchors.top : section.bottom
        anchors.topMargin : 20
        anchors.left: root.left
        width: root.width
        Repeater{
            id : repeater
            width : children.width

            model : 10
            delegate : root.delegate
        }
        Behavior on height {
            NumberAnimation{
                duration  : 200
            }
        }
        Behavior on opacity {
            NumberAnimation{
                duration  : 200
            }
        }
    }

}
