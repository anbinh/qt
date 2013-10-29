import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "base.js" as Base


ProgressBar {
    id : progressbar
    maximumValue: 100
    minimumValue : 0
    width : 200
    height : 10
    style: ProgressBarStyle {
        background: Rectangle {
            color: Base.Color.Disabled.Value
            implicitWidth: progressbar.width
            implicitHeight: progressbar.height
            radius : progressbar.height/2
        }
        progress: Rectangle {
            id : completeRect
            color: Base.Color.Primary.Value
            radius : progressbar.height/2
            states: State {
                    name: "hoverState"
                    when : progressbar.hovered
                    PropertyChanges { target: completeRect; color: Base.Color.Primary.Light}
                }


            transitions: Transition {
                to : "hoverState"
                PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
            }
        }
    }
}
