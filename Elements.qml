import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import "styles/base.js" as Base
import "styles"

Item{
    anchors.fill: parent
    ColumnLayout {
            anchors.fill: parent
            anchors.margins : 30
            width: parent.width - 40
            height : parent.height - 40
            RowLayout{
                DNAButton {
                    text : "Default"
                    type : "Default"
                    onClicked : {console.log("Default button has been clicked")}
                    tooltip: "Hello <i>World</i>"
                }
                DNAButton {
                    text : "Primary"
                    type : "Primary"
                    onClicked : {console.log("Primary button has been clicked")}
                }
                DNAButton {
                    text : "Success"
                    type : "Success"
                }
                DNAButton {
                    text : "Info"
                    type : "Info"
                }

            }
            RowLayout {

                DNAButton {
                    text : "Warning"
                    type : "Warning"
                }
                DNAButton {
                    text : "Danger"
                    type : "Danger"
                }
                DNAButton {
                    text : "Inversed"
                    type : "Inversed"
                }
                DNAButton {
                    text : "Disabled"
                    type : "Disabled"
                }
            }
            DNASlider{
                id : myslider
                width : 400
                stepSize: 10
                onValueChanged : {console.log("Slider value: "+ value)}
            }
            DNAProgressBar{
                width : 400
                value: myslider.value
                onValueChanged : {console.log("Progress bar value: "+ value)}
            }


            Rectangle{
                color : "transparent"
                width: parent.width
                height : myTxt.height
                Label{
                    id : myTxt
                    text : "  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum "
                    color : Base.Color.BlackDark
                    font.bold: true

                    wrapMode: Text.Wrap
                    width: parent.width
                }
            }

            GroupBox {
                Column {
                    spacing: 4
                    ExclusiveGroup { id: group }

                    DNARadioButton {
                        text: "Options 1"
                        exclusiveGroup: group
                        onClicked : {console.log("Option 1 chosen ")}
                     }
                    DNARadioButton {
                        text: "Options 2"
                        exclusiveGroup: group
                        onClicked : {console.log("Option 2 chosen ")}
                     }
                    DNARadioButton {
                        exclusiveGroup: group
                        onClicked : {console.log("Option 3 chosen ")}
                     }
                    DNARadioButton {
                        exclusiveGroup: group
                        enabled : false
                        text : "Disabled with unchecked"
                        onClicked : {console.log("Option 3 chosen ")}
                     }
                    DNARadioButton {
                        exclusiveGroup: group
                        enabled : false
                        text : "Disabled with checked"
                        checked : true
                        onClicked : {console.log("Option 3 chosen ")}
                     }
                }

            }
            Column {
                spacing : 4
                DNACheckBox {
                    text : "Orange"
                    onClicked : {
                        if (checked==true){
                            console.log("Orange ChekcBox selected!")
                        }   else console.log("Orange ChekcBox unselected!")
                    }
                }
                DNACheckBox {
                    text : "Banana"
                    onClicked : {
                        if (checked==true){
                            console.log("Banana ChekcBox selected!")
                        }   else console.log("Banana ChekcBox unselected!")
                    }
                }
                DNACheckBox {
                    text : "Mango"
                    onClicked :{
                        if (checked==true){
                            console.log("Mango ChekcBox selected!")
                        }   else console.log("Mango ChekcBox unselected!")
                    }
                }
                DNACheckBox {
                    text : "Disable me unchecked"
                    enabled: false
                }
                DNACheckBox {
                    text : "Disable me checked"
                    enabled: false
                    checked : true
                }
            }
            DNAComboBox {
                model: ListModel {
                    id: cbItems
                    ListElement { text: "Banana"; color: "Yellow" }
                    ListElement { text: "Apple"; color: "Green" }
                    ListElement { text: "Coconut"; color: "Brown" }
                }
                type : "Primary"
        //            onCurrentIndexChanged: console.log(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)
            }
            RowLayout {
                DNATextField{
                    type : "Primary"
                    placeholderText : "Type here"
                }
                DNATextField{
                    type : "Danger"
                    placeholderText : "Type here"
                }
                DNATextField{
                    type : "Disabled"
                    placeholderText : "Disabled"
                }
            }
            RowLayout{
                DNASpinBox{
                    maximumValue: 200
                    minimumValue: 0
                    stepSize: 10
                    type : "Default"
                    width: 200
                    onValueChanged: console.log("Valued of spinbox changed: " + value)
                }
                DNASpinBox{
                    maximumValue: 100
                    minimumValue: 0
                    stepSize: 10
                    type : "Primary"
                }
                DNASpinBox{
                    maximumValue: 300000
                    minimumValue: 0
                    stepSize: 3000
                    decimals : 1
                    prefix : "$"
                    type : "Disabled"
                    spinboxWidth: 130
                }
            }
            RowLayout{
                DNASwitch{
                    type : "Primary"
                }
                DNASwitch{
                    implicitWidth : 75
                    implicitHeight: 35
                    type : "Danger"
                    onOnChanged: {
                        if (on){
                            console.log("THE valueof switch butotn is on");
                        }
                        else console.log("THE valueof switch butotn is off");
                    }
                }
                DNASwitch{
                    type : "Info"
                    on : false
                }
                DNASwitch{
                    type : "Success"
                    on : false
                }
                DNASwitch{
                    type : "Info"
                    state : "onDisabledState"
                    enabled : false
                    on : true
                }
                DNASwitch{
                    type : "Info"
                    state : "onDisabledState"
                    on : false
                    enabled : false
                }
            }


        }


}
