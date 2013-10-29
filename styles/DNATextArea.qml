import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "base.js" as Base
import "privates"

MyTextArea{
    property string type : "Primary"
    text: "<b>Hello</b> <i>World!</i>"
    width: 300
    height: 150
    enabled: true
    textColor : Base.Color.BlackDark
    backgroundVisible: true
    textFormat : TextEdit.RichText
    selectionColor : Base.Color[type].Value
    selectedTextColor: Base.Color.White
    Rectangle{
        anchors.centerIn: parent
        implicitHeight: parent.height + 4
        implicitWidth: parent.width + 4
        color : "transparent"
        border.width: 2
        border.color: Base.Color.Disabled.Value
        radius : 4
    }
}
