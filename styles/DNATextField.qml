import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "base.js" as Base

// implement custom settings of selectionColor
TextField {
    id : txtField
    width : 200
    height : 35
    property string type : "Default"
    property color bgColor : Base.Color.Grey
    property int radius : 4

    font : Base.Font.family

    style: TextFieldStyle {
        textColor: Base.Color.BlackDark
        selectionColor : Base.Color[txtField.type].Value
        selectedTextColor : Base.Color.White
        background: Rectangle {
            id : completeRect
            radius: txtField.radius
            implicitWidth: txtField.width
            implicitHeight: txtField.height
            border.color:   Base.Color.Disabled.Value
            border.width: 2
            color : txtField.enabled ? "white" : Qt.lighter(Base.Color.Disabled.Value,1.2)
            function changeColor(){
                if (type == "Custom") {
                    return bgColor;

                } else
                    if (type == "Disabled"){
                        txtField.enabled = false;
                        return Base.Color[type].Dark;
                    } else return Base.Color[type].Value;
            }
            states: [
                State {
                    name: "focusState"
                    when : txtField.focus
                    PropertyChanges { target: completeRect; border.color: completeRect.changeColor()}
                },
                State {
                    name: "hoverState"
                    when : txtField.hovered
                    PropertyChanges { target: completeRect; border.color: completeRect.changeColor()}
                }]


            transitions: [
                Transition {
                    to : "focusState"
                    PropertyAnimation { properties: "border.color"; easing.type: Easing.InOutQuad; duration: 300 }
                },
                Transition {
                    to : "hoverState"
                    PropertyAnimation { properties: "border.color"; easing.type: Easing.InOutQuad; duration: 300 }
                }
            ]
        }
    }
    Component.onCompleted: {
        if (type == "Disabled"){
            txtField.enabled = false;
         }
    }
}
