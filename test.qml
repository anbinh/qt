import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.0
import "styles/base.js" as Base
import "styles/js/modal.js" as Modal
import "styles"



ApplicationWindow {
    id : app
    title: "This Is My Application"
    width : 900
    minimumWidth : 700
    minimumHeight: 600
    height :750

    toolBar: ToolBar {
            RowLayout {
                anchors.fill: parent
                ToolButton {
                    iconSource: "styles/images/user.png"
                }
            }
        }



    DNATabView {
            id:tabview
            anchors.fill : parent
            anchors.centerIn: parent
            anchors.margins: 10
            bgColor : Base.Color.WhiteLight

            enabled: true
            tabPosition: Qt.TopEdge

            Tab {
                title: "Thumbnail"
                Item{
                    anchors.left : parent.left
                    anchors.top : parent.top
                    anchors.topMargin : 2
                    anchors.leftMargin: 2
                    width: parent.width - 4
                    height: parent.height - 4
                    ColumnLayout{
                        anchors.fill: parent
                        Rectangle{
                            anchors.fill: parent
                            color : "transparent"
                            border.width: 0
                            border.color: Base.Color.Disabled.Value
                            radius : 0
                            DNAThumbnail{
                                x : 10
                                y : 10

                            }
                            DNAThumbnail{
                                x : 200
                                y : 10
                                imageSource: "http://www.newtandharolds.com/wp-content/uploads/2012/07/NEWTS-COMING-SOON1.jpg"

                            }
                            DNAThumbnail{
                                x : 400
                                y : 10
                                imageSource: "http://www.kennercollector.com/downloads/H327LOG.JPG"

                            }
                            DNAThumbnail{
                                x : 10
                                y : 200
                                imageSource: "http://newimg.globalmarket.com/filestorage/gallery/manufacturer/786/2302786/prod/0_1380004768366.jpg"

                            }


                        }
                    }
                }
            }


            Tab {
                title: "Modal"
                Item{
                    anchors.left : parent.left
                    anchors.top : parent.top
                    anchors.topMargin : 2
                    anchors.leftMargin: 2
                    width: parent.width - 4
                    height: parent.height - 4
                    ColumnLayout{
                        anchors.fill: parent
                        Rectangle{
                            anchors.fill: parent
                            color : "transparent"
                            border.width: 0
                            border.color: Base.Color.Disabled.Value
                            radius : 0
                           DNAButton{
                                anchors.centerIn: parent
                                text : "Show Modal"
                                type : "Primary"
                                onClicked :{
                                    var content = "<i>World!</i><i>World!</i>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                                    var title = "This is custom header"
                                    var width = 600


                                    Modal.show(parent,title,content,width)

                                }
                            }

                            DNATooltip{
                                id : root
                                x : 20
                                y : 30
                                MouseArea{
                                    anchors.fill : parent
                                    onPressed : {
                                        if (root.state=="up") root.state = "left"
                                        else if (root.state=="left") root.state = "down"
                                        else if (root.state=="down") root.state = "right"
                                        else if (root.state=="right") root.state="up"
                                        else root.state = "up"
                                    }
                                }

                            }
                            DNARectangle{
                                x : 240
                                y : 50
                                width : 100
                                height: 50
                                color : Base.Color.Green
                                radius : 20
                                opacity : 1
                                hasTopRightRadius: false
                                hasBottomRightRadius:  false

                            }
                            DNARectangle{
                                x : 340
                                y : 50
                                width : 100
                                height: 50
                                color : Base.Color.Blue
                                radius : 20
                                opacity : 1
                                hasTopLeftRadius:  false
                                hasBottomLeftRadius:  false

                            }
                            DNARectangleBorder{
                                x : 400
                                y : 150
                                width : 200
                                height : 145
                                hasTopLeftRadius : true
                                hasTopRightRadius : true
                                hasBottomLeftRadius : false
                                hasBottomRightRadius : false
                                border.color: "red"
                                border.width : 16
                                radius : 16

                            }

//                            DNAModal{
//                                anchors.centerIn: parent
//                                id : customModal
//                                width : 700
//                                title : "This is custom header"
//                                content : "<i>World!</i><i>World!</i>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
////                                content : "<b>Hello</b> <i>World!</i>"
////                                Rectangle{
////                                    width: parent.width
////                                    height : parent.height
////                                    anchors.fill : parent
////                                    color : "red"
////                                    opacity : 0.3
////                                }
//                                onOkClicked: console.log("Modal OK button clicked")
//                                onCancelClicked: console.log("Modal Cancel Button Clicked")
//                                onClosed : console.log("on close clicked")
//                            }

                        }
                    }
                }
            }

            Tab {
                anchors.centerIn: parent
                title: "Search Form && Icon Field"
                Item{
                    anchors.centerIn: parent
                    ColumnLayout{
                        anchors.centerIn: parent
                        DNAButtonIcon{
                            text : "Click me now"
                            type : "Success"
                            width : 140
                        }
                        DNAButtonIcon{
                            text : "   OK   "
                            type : "Danger"
                            width : 140
                        }
                        DNAButtonIcon{
                            text : "Click me"
                            type : "Info"
                            hasLeftIcon : false
                            width : 110

                        }

                        DNATextFieldIcon{
                            imageSource: "styles/images/user.png"
                            imageWidth: 15
                            imageHeight: 15
                            type : "Success"
                        }
                        DNATextFieldIcon{
                            imageSource: "styles/images/keys.png"
                            imageWidth: 15
                            imageHeight: 15
                            type : "Danger"
                            hasLeftIcon: true
                        }
                        DNATextFieldIcon{
                            imageSource: "styles/images/keys.png"
                            imageWidth: 15
                            imageHeight: 15
                            type : "Disabled"
                            hasLeftIcon: true
                        }
                        DNASearchField{
                        }
                        DNASearchField{
                            type : "Primary"
                            onAccepted: {
                                console.log("You have searched:" + text)
                            }
                        }
                        DNASearchField{
                            type : "Info"
                        }
                        DNASearchField{
                            type : "Disabled"
                        }
                        DNATextArea{
                             text : "My text is right"
                        }
                    }
                }


            }

            Tab {
                title: "TB Custom"
                TableViewTestCustom{
                    anchors.fill : parent
                    anchors.margins: 10
                    anchors.topMargin: 40
                }

            }
            Tab {
                title: "Table View"
                TableViewTestDefault{
                    anchors.fill : parent
                    anchors.margins: 10
                    anchors.topMargin: 40
                }
            }
            Tab {
                id: controlPage
                title: "Controls"
                Elements{
                 anchors.centerIn: parent
                }
            }







        }





}
