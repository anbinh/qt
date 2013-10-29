import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0
import "base.js" as Base


ComboBox {
    id : cbb
    property string type : "Default"
    property color bgColor : Base.Color.Grey
    property color bgColorLight : Base.Color.GreyLight
    property color bgColorDark : Base.Color.GreyDark
    property color textColor : Base.Color.White
    width: 125
    height : 35
    function changeColor(){
        if (cbb.type == "Custom") {
            return cbb.hovered ? cbb.pressed ? cbb.bgColorDark : cbb.bgColorLight : cbb.bgColor;
        } else
        return cbb.hovered ? cbb.pressed ? Base.Color[cbb.type].Dark : Base.Color[cbb.type].Light : Base.Color[cbb.type].Value;
    }
    style : ComboBoxStyle {
        background : Item{
            implicitWidth: cbb.width
            implicitHeight:  cbb.height
            Rectangle{
                id : theRect
                implicitWidth: cbb.width
                implicitHeight:  cbb.height
                color : cbb.changeColor()
                radius: 4
                states: [
                    State {
                        name: "clickState"
                        when : cbb.pressed
                        PropertyChanges {
                            target: theRect;
                            color: {
                                if (cbb.type == "Custom"){
                                    cbb.bgColorDark
                                } else return Base.Color[type].Dark
                            }
                        }
                    },
                    State {
                        name: "hoverState"
                        when : cbb.hovered
                        PropertyChanges {
                            target: theRect;
                            color: {
                                if (cbb.type == "Custom"){
                                    cbb.bgColorLight
                                } else return Base.Color[type].Light
                            }
                        }
                    }

                ]
                transitions: [
                    Transition {
                        to : "clickState"
                        PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                    },
                    Transition {
                        to : "hoverState"
                        PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                    }]

            }
            InnerShadow {
                id: rectShadow;
                anchors.centerIn: source
                width : source.width
                height : source.height
                cached: true;
                horizontalOffset: 0;
                verticalOffset: -6;
                radius: 0;
                samples: 16;
                color: Base.Color[cbb.type].Dark;
                smooth: true;
                source: theRect;
                fast : true
            }
        }

        label : Rectangle{
            id : rectLabel
            color : cbb.changeColor()
            Label {
                color : Base.Color.White
                text : cbb.currentText
                font.family:  Base.Font.family
                anchors.left: parent.left
                anchors.verticalCenter : parent.verticalCenter
                anchors.leftMargin: 10
            }
            Image {
                source : "images/arrow-down@2x.png"
                anchors.right: parent.right
                anchors.verticalCenter : parent.verticalCenter
                anchors.rightMargin: 10
                opacity : cbb.hovered ? 1 : 0.7
            }
            states: [
                State {
                    name: "clickState"
                    when : cbb.pressed
                    PropertyChanges {
                        target: rectLabel;
                        color: {
                            if (cbb.type == "Custom"){
                                cbb.bgColorDark
                            } else return Base.Color[type].Dark
                        }
                    }
                },
                State {
                    name: "hoverState"
                    when : cbb.hovered
                    PropertyChanges {
                        target: rectLabel;
                        color: {
                            if (cbb.type == "Custom"){
                                cbb.bgColorLight
                            } else return Base.Color[type].Light
                        }
                    }
                }

            ]
            transitions: [
                Transition {
                    to : "clickState"
                    PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                },
                Transition {
                    to : "hoverState"
                    PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                }
            ]

        }
    }
    MouseArea { cursorShape: Qt.PointingHandCursor; acceptedButtons: Qt.NoButton;anchors.fill: parent }

}
