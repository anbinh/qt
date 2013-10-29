import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0

import "base.js" as Base

Button {
        id : btn
        text: "<i>Push Me</i>"
        width : 125
        height : 35
        property string type : "Default"
        property color bgColor : Base.Color.Grey
        property color bgColorLight : Base.Color.GreyLight
        property color bgColorDark : Base.Color.GreyDark
        property color textColor : Base.Color.White
        property int radius : 4
        // define custom tooltip
        property string tooltipText : "Hello world"
        style : ButtonStyle {
            background : Item{
                implicitWidth: btn.width
                implicitHeight:  btn.height
                Rectangle{
                    id : theRect
                    implicitWidth: btn.width
                    implicitHeight:  btn.height
                    color :{
                        if (btn.type == "Custom"){
                            return btn.bgColor;
                        } else {
                            return Base.Color[type].Value;
                        }

                    }

                    radius: btn.radius
                    states: [
                        State {
                            name: "clickState"
                            when : btn.pressed
                            PropertyChanges {
                                target: theRect;
                                color: {
                                    if (btn.type == "Custom"){
                                        btn.bgColorDark
                                    } else return Base.Color[type].Dark
                                }
                            }
                        },
                        State {
                            name: "hoverState"
                            when : btn.hovered
                            PropertyChanges {
                                target: theRect;
                                color: {
                                    if (btn.type == "Custom"){
                                        btn.bgColorLight
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
                    color: Base.Color[btn.type].Dark;
                    smooth: true;
                    source: theRect;
                    fast : true
                }
            }

            label : Label{
                color : btn.textColor
                text : btn.text
                verticalAlignment : Text.AlignVCenter
                horizontalAlignment : Text.AlignHCenter
            }
        }
        tooltip : ""


        MouseArea {
            cursorShape: Qt.PointingHandCursor;
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
        }


}

