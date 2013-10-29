import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import "base.js" as Base


RadioButton {
    id : rdioBtn
    text: "Default DNA Radio Button"
    property string textColor : Base.Color.BlackDark
    style: RadioButtonStyle {
        indicator: Rectangle {
                implicitWidth: 20
                implicitHeight: 20
                radius: 10
                border.color: {
                    if (rdioBtn.enabled == true){
                        return rdioBtn.checked ? Base.Color.Primary.Value : Base.Color.Disabled.Value
                    } else {
                        return Qt.lighter(Base.Color.Disabled.Value,1.1)
                    }
                }
                border.width: 4
                color : {
                    if (rdioBtn.enabled==true){
                        return "white"
                    } else {
                        return  rdioBtn.checked ? "white" : Qt.lighter(Base.Color.Disabled.Value,1.1)
                    }
                }
                Rectangle {
                    anchors.centerIn: parent
                    implicitWidth: 6
                    implicitHeight: 6
                    visible: {
                        if ((rdioBtn.checked == true) || (rdioBtn.hovered==true)){
                            return true
                        }    else return false;
                    }
                    color:{
                              if (rdioBtn.enabled == true){
                                  return rdioBtn.checked ? Base.Color.Primary.Value : Base.Color.Disabled.Value
                              } else {
                                  Qt.lighter(Base.Color.Disabled.Value,1.1)
                              }
                          }
                    radius: 3

                }
        }
        label : Label{
            color : {
             if (rdioBtn.enabled==true){
                 return rdioBtn.textColor
             } else {
                 return Qt.darker(Base.Color.Disabled.Value,1.7)
             }
            }
            text : rdioBtn.text
            font.bold: true
            verticalAlignment : Text.AlignVCenter
            horizontalAlignment : Text.AlignHCenter

        }
    }
    MouseArea { cursorShape: Qt.PointingHandCursor; acceptedButtons: Qt.NoButton;anchors.fill: parent }
 }

