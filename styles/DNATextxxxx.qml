import QtQuick 2.1
import QtQuick.Controls 1.0
import "base.js" as Base

Item {
    id: containing_rect
    property string text
    property alias color: text_field.color
    property alias font: text_field.font
    property alias wrapMode: text_field.wrapMode
    property alias contentWidth: text_field.contentWidth

    text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
    //text: "a short string"

    Label {
        id: text_field
        anchors.centerIn: parent

        height: parent.height
        width: parent.width
        text: parent.text
        color : Base.Color.Black
        font.pointSize: 12
        opacity: 1
        wrapMode: Text.Wrap


    }

    Label {
        id: dummy_text
        text: parent.text
        visible: false
    }

    states: [
            State {
                name: "wide text"
                when: containing_rect.text.length > 20
                PropertyChanges {
                    target: containing_rect
                    width: containing_rect.width
                    height: text_field.paintedHeight
                }
            },
            State {
                name: "not wide text"
                when: containing_rect.text.length <= 20
                PropertyChanges {
                    target: containing_rect
                    width: dummy_text.paintedWidth
                    height: text_field.paintedHeight
                }
            }
        ]
}
