import QtQuick 2.1
import QtQuick.Controls 1.0
import QtGraphicalEffects 1.0


import "../styles/base.js" as Base

Rectangle{
    anchors.left: parent.left
    anchors.leftMargin : 5
    property alias text : title.text
    property alias source: img.source
    Image{
        id : img
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        source : "images/home.png"
        scale: 0.5
        ColorOverlay {
            id : overlay
            anchors.fill: img
            source: img
            color: Base.Color.Black
            Behavior on color{
                ColorAnimation { duration: 200 }
            }
        }
    }

    Label{
        id : title
        anchors.left: parent.left
        anchors.leftMargin: 27
        font.family: Base.Font.family
        font.capitalization: Font.AllUppercase
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 3
        color : Base.Color.BlackDark
        font.pixelSize: 12
        font.bold: true
    }
}
