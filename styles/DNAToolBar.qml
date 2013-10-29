import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0

import "base.js" as Base

ToolBar{
    style : Style {

        padding.left: 6
        padding.right: 6
        padding.top: 3
        padding.bottom: 3

        property Component panel: Item {
            implicitHeight: 40
            implicitWidth: 200
            Rectangle {
                anchors.fill: parent
                gradient: Gradient{
                    GradientStop{color: "#f7f7f7" ; position: 0}
                    GradientStop{color: "#d7d7d7" ; position: 1}
                }
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#999"
                }
            }
        }
    }
}
