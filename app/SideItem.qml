import QtQuick 2.1
import QtQuick.Controls 1.0
import QtGraphicalEffects 1.0


import "../styles/base.js" as Base

Rectangle{
    id : root
    width : 200
    height : 30
    color : checked ? Base.Color.Primary.Value : "transparent"
    property int maxWidth : 0
    property alias text : label.text
    property alias source : img.source
    property alias hovered : behaviour.containsMouse
    property alias pressed : behaviour.pressed
    property color defaultBgColor : Base.Color.Black

    property bool iconEnable : true
    property bool checked: false
    property int leftMarginText : 50
    property ExclusiveGroup exclusiveGroup: null

    signal clicked(bool checked)

    gradient: Gradient {
            GradientStop { position: 0.0; color: checked ? Base.Color.Primary.Value : "transparent" }
            GradientStop { position: 1.0; color: checked ? Base.Color.Primary.Light : "transparent" }
        }

    function changeColor(){
        if (checked){
            return Base.Color.WhiteLight
        } else {
            return root.pressed ? Base.Color.BlackDark : root.hovered ? Base.Color.Primary.Dark : defaultBgColor
        }
    }

    onExclusiveGroupChanged: {
        if (exclusiveGroup)
            exclusiveGroup.bindCheckable(root)
    }

    MouseArea{
        id : behaviour
        anchors.fill : parent
        propagateComposedEvents: true
        onClicked: {
            root.checked = !root.checked
            root.clicked(root.checked)
        }
    }

    Image{
        id : img
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source : "images/home.png"
        scale: 0.5
        visible : (parent.iconEnable) ? true : false
        ColorOverlay {
            id : overlay
            anchors.fill: img
            source: img
            color: root.changeColor()
            Behavior on color{
                ColorAnimation { duration: 200 }
            }
        }
    }
    Label{
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: parent.leftMarginText
        width : parent.width - anchors.leftMargin*2
        id : label
        text : "title"
        font.capitalization: Font.Capitalize
        color :root.changeColor()
        font.bold: root.checked ? true : root.hovered ? true : false
        font.pixelSize: 12
        font.family: Base.Font.family
        elide: Text.ElideRight

    }



}
