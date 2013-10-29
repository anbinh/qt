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
        property bool hasLeftIcon : true
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

            label : Rectangle{
                id : txtLabel
                property alias text : lb.text
                color : "transparent"
                anchors.fill: parent


                Image {
                    id :icon
                    anchors.right : btn.hasLeftIcon ? undefined : txtLabel.right
                    anchors.rightMargin: btn.hasLeftIcon ? undefined : 10
                    anchors.left : btn.hasLeftIcon ? txtLabel.left : undefined
                    anchors.leftMargin: btn.hasLeftIcon ? 10 : undefined
                    anchors.verticalCenter: parent.verticalCenter
                    source : "images/user.png"
                    width : 15
                    height: 15
                    ColorOverlay {
                        id : colorOverlay
                        anchors.fill: icon
                        source: icon
                        color: btn.hovered ? btn.pressed ? Qt.darker(btn.textColor,1.2): Qt.lighter(btn.textColor,1.3) : btn.textColor;
                    }
                }
                Label{
                    id : lb
                    text : btn.text
                    color : btn.hovered ? btn.pressed ? Qt.darker(btn.textColor,1.2): Qt.lighter(btn.textColor,1.3) : btn.textColor;
                    anchors.right : btn.hasLeftIcon ? undefined : icon.left
                    anchors.rightMargin: btn.hasLeftIcon ? undefined : 10
                    anchors.left : btn.hasLeftIcon ? icon.right : undefined
                    anchors.leftMargin: btn.hasLeftIcon ? 10 : undefined
                    anchors.verticalCenter: parent.verticalCenter

                }

            }
        }
        tooltip : ""


        MouseArea {
            cursorShape: Qt.PointingHandCursor;
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
        }


}

