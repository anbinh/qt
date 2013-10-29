import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0
import "base.js" as Base
import "js/modal.js" as Modal

// implement custom settings of selectionColor

// Define Modal
Item{
    id : modal
    width: 520
    height: title.anchors.topMargin + title.height + horizontalLine.height + horizontalLine.anchors.topMargin + contentLabel.height + footer.height + contentLabel.anchors.topMargin*2 + main.border.width

    property string title : "My Modal"
    property string content : "This is default content"
    property alias color: main.color
    property string okButtonText : "OK"
    property string okButtonType : "Primary"
    property string cancelButtonText : "Cancel"
    property string cancelButtonType : "Danger"
    signal okClicked
    signal cancelClicked
    signal closed
    function okClickedEvent(){
        console.log("Default seeting click event")
    }
    BorderImage {
        anchors {
            fill: parent
            leftMargin: -4; topMargin: -4; rightMargin: -6; bottomMargin: -6
        }
        source: 'images/box-shadow.png'; smooth: true
        border.left: 10; border.top: 10; border.right: 10; border.bottom: 10
    }

    Rectangle{
        id : main
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color : Base.Color.WhiteLight
        border.color: Base.Color.Grey
        border.width: 1

        radius : 4
        // box shadow


        // Define header label
        Label{
            id : title
            anchors.left : parent.left
            anchors.top : parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 15
            text : modal.title
            font.pointSize: 16
            font.bold: true
            color: Qt.darker(Base.Color.BlackDark,1.5)
            opacity: modal.opacity

        }
        // Define close icon
        Image{
            id : closeIcon
            width : 15
            height: 15
            anchors.right : parent.right
            anchors.top : parent.top
            anchors.rightMargin: 10
            anchors.topMargin: 10
            source : "images/close_icon.png"
            opacity: modal.opacity
            ColorOverlay {
                id : overlay
                anchors.fill: closeIcon
                source: closeIcon
                color: Base.Color.Black
            }
            MouseArea{
                id : mouseArea
                anchors.fill : parent
                hoverEnabled: true
                onEntered: {
                    overlay.color = Base.Color.RedLight
                }
                onExited: {
                    overlay.color = Base.Color.Black
                }
                onPressed: {
//                    modal.isShowed = false
                    modal.closed();
                    modal.destroy();
                }
            }

        }

        // Define header horizontal line
        Rectangle{
            id : horizontalLine
            anchors.left : parent.left
            anchors.leftMargin: main.border.width
            anchors.top : title.bottom
            anchors.topMargin: 15
            implicitWidth: parent.width - main.border.width*2
            implicitHeight: 2
            color : Qt.lighter(Base.Color.Disabled.Light,1.2)
            opacity: modal.opacity
        }
        // Define text content
        Label{
            id : contentLabel
            text : modal.content
            anchors.left : parent.left
            anchors.leftMargin: 20
            anchors.top : horizontalLine.bottom
            anchors.topMargin: 20
            color : Base.Color.Black
            font.pointSize: 11
            font.bold : true
            opacity: modal.opacity
            wrapMode: Text.Wrap
            width : parent.width - anchors.leftMargin*2



        }

        // Define footer
        Rectangle{
            id : footer
            implicitWidth: parent.width - main.border.width*2
            implicitHeight: 60
            anchors.left : parent.left
            anchors.leftMargin : main.border.width
            anchors.top : contentLabel.bottom
            anchors.topMargin : contentLabel.anchors.topMargin
            color : "#eff0f2"
            radius : 4
            opacity: modal.opacity
            RowLayout{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right : parent.right
                anchors.rightMargin: 20
                DNAButton{
                    type : modal.cancelButtonType
                    text : modal.cancelButtonText
                    opacity: modal.opacity
                    onClicked: {
                        modal.cancelClicked();
                        modal.closed();
                        modal.destroy();
                    }
                }
                DNAButton{

                    id : okBtn
                    type : modal.okButtonType
                    text : modal.okButtonText
                    opacity: modal.opacity
                    onClicked: {
                        modal.okClicked();

                    }
                }
            }
        }


    }
}


