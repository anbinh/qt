import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.0
import QtQuick.XmlListModel 2.0
import "styles/base.js" as Base
import "styles/js/modal.js" as Modal
import "styles"
import "audio"
import "utils"
import "app"



ApplicationWindow {
    id : app
    title: "MusicApp"
    width : 1024
    minimumWidth : 700
    minimumHeight: 600
    height :750


    toolBar: DNAToolBar {
            height: 50
            RowLayout {
                anchors.fill: parent
                Rectangle{
                    id : separator1
                    height : 10
                    color : "transparent"
                    width : 20
                }
                Image{
                    source : "styles/images/logo_sample.svg"
                    width : 40
                    height : 40
                    sourceSize.width : 40
                    sourceSize.height: 40
                    MouseArea{
                        anchors.fill : parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            debug.visible = !debug.visible
                        }
                    }
                }

                Label{
                    text : "MusicApp"
                    width : 300
                    font.pixelSize: 20
                    font.bold: true
                    color : Base.Color.BlackDark
                }
                Rectangle{
                    id : info
                    height : 10
                    color : "transparent"
                    Layout.fillWidth  :true
                }

                Label{
                    id : username
                    text : "binhdna"
                    width : 100
                    font.pixelSize: 12
                    color : Qt.darker(Base.Color.GreyDark,1.9)
                }

                DNAToolButton {
                    iconSource: "styles/images/user.png"
                    tooltipText : "Người sử dụng"
                    tooltipPosition : "down"
                }
                DNAToolButton {
                    iconSource: "styles/images/cogwheel.png"
                    tooltipText : "Settings"
                    tooltipPosition : "down"
                }
                DNASearchField{
                    id : search
                    width : 200
                    type : "Primary"
                    bgColor : Base.Color.White
                    placeholderText: "Search your music"
                    onAccepted: {
                        libraryModel.source = "http://115.78.7.157:1337/search?q=" + text
                    }
                }
            }
        }

    statusBar: AudioPlayer{
        id : audioPlayer

//        source : "http://m.mp3.zing.vn/xml/song-load/MjAxMyUyRjEwJTJGMjElMkY0JTJGNiUyRjQ2MmIxM2Q2Yjg4NWQ2NTdmNmY1NGVhYjUzYzBhNzllLm1wMyU3QzI="
//        source : searchbox.text
        thumbnail : "http://image.mp3.zdn.vn/thumb/240_240/covers/c/c/ccf44638437ac2a2d8682076d967fd94_1382232829.jpg"
        infoArea : "<b>Never Say Never</b> - Justin Bieber"
        onRewindClicked: {
            debug.log("You clicked REWIND button")
            infoTable.currentRow -= 1
            infoTable.playAtRow(infoTable.currentRow)
        }
        onForwardClicked: {
            debug.log("You clicked FORWARD button")
            infoTable.currentRow += 1
            infoTable.playAtRow(infoTable.currentRow)
        }
        onPlayClicked: {
            debug.log("You clicked PLAY button. STATUS: "+ status)
        }

        onReplayClicked: {
            debug.log("You clicked REPLAY button")
        }
        onShuffleClicked: {
            debug.log("You clicked SHUFFLE button")
            if (shuffleMode){
                console.log("suffle on")
            } else console.log("shuffle off")
        }
        onVolumeClicked: {
            debug.log("You clicked VOLUME button")
        }
        onVolumeChanged: {
//            debug.log("Volume has been changed to:" + (volume|0))
        }
        onSeeking: {
//            debug.log("Seeking to new pos: " + ((milisecs/1000)|0) + "s")
        }
        onPositionChanged: {
//            console.log("Position changed:" + ((position/1000)|0) + "s")
        }
        onErrorChanged: {
            debug.log("Error CODE: " + error)
        }
        onErrorStringChanged: {
            debug.log("Error string has occured: " + errorString)
            debug.log(source)
        }
        onPlaybackStateChanged: {
            if (playbackState==Audio.StoppedState){
                if (!shuffleMode){
//                    infoTable.currentRow += 1
//                    infoTable.playAtRow(infoTable.currentRow)
                } else {
                    var randomRow = (Math.random()*infoTable.rowCount)|0
                    while (randomRow==infoTable.currentRow){
                        randomRow = (Math.random()*infoTable.rowCount)|0
                        console.log("hehehe -- random row equals -- rarely")
                    }
                    infoTable.currentRow = randomRow
                    infoTable.playAtRow(randomRow)
                }

            }
        }

    }

    XmlListModel {
        id: libraryModel
        query: "/songs/song"

        XmlRole { name: "order"; query: "order/string()" }
        XmlRole { name: "id"; query: "id/string()" }
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "artists"; query: "artists/string()" }
        XmlRole { name: "site"; query: "site/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        onStatusChanged: {

            if (status===XmlListModel.Null){
                console.log("No XML data has been set for this model.")
                infoTable.visible = false
            } else if (status===XmlListModel.Ready){
                console.log("The XML data has been loaded into the model.")
                infoTable.visible = true
            } else if (status===XmlListModel.Loading){
                console.log("The model is in the process of reading and loading XML data.")
            } else if (status===XmlListModel.Error){
                conosole.log("An error occurred while the model was loading. See errorString() for details about the error.")
            }
        }
    }
    SplitView{
        anchors.fill : parent


        // Sidebar
        Rectangle{
            id : sideBar
            width: 200
            property int maxWidth: 300
            Layout.maximumWidth: maxWidth
            Layout.minimumWidth: 200
            color : "white"

            SideBarScrollView{
                id :sidebarScrollView
                anchors.fill: parent
                anchors.bottomMargin: width
                frameVisible : false
//                hideScrollBarAuto : false

                SidebarMenu{
                    z : 1
                    id : sidebarMenu
                    width : sidebarScrollView.width
                    onClicked: {
                        console.log("U chosee section:" + section + " Title: " + title + " checked: " + checked)
                    }
                }
            }
            Image{
                id : thumbnail
                source : "http://image.mp3.zdn.vn/covers/6/2/62df066e6f9196dbeedadd35931b88ae_1382408334.jpg"
                width: sidebarScrollView.width
                height: sidebarScrollView.width
                anchors.bottom: parent.bottom
                anchors.left: parent.left
            }

        }


        DNATableView{
            id : infoTable
            model : libraryModel
            Layout.fillWidth: true
            TableViewColumn{ role: "order"  ; title: "Index";width : 50  }
            TableViewColumn{ role: "id"  ; title: "ID";width : 100  }
            TableViewColumn{ role: "title" ; title: "Title"; elideMode : Text.ElideRight; width : 300 }
            TableViewColumn{ role: "artists" ; title: "Artists";width : 150   }
            TableViewColumn{ role: "site" ; title: "Site" ;width : 100   }
            TableViewColumn{ role: "link" ; title: "Link" ;width : 200  }
            function formatSite(site){
                var sites = {
                    "ns" : "nhacso.net",
                    "zi" : "mp3.zing.vn",
                    "nv" : "nhacvui.vn",
                    "cc" : "chacha.vn",
                    "gm" : "music.go.vn",
                    "ke" : "keeng.vn",
                    "nct" : "nhaccuatui.com",
                    "nn" : "nghenhac",
                    "csn" : "chiasenhac.com"
                }
                return sites[site]
            }
            function  playAtRow(presentRow){
                var currentRow = libraryModel.get(presentRow)
                console.log(currentRow.id + ":" + currentRow.link)
                audioPlayer.play(currentRow.link)
                audioPlayer.infoArea =  "<b>"+ currentRow.order + ". " + Base.htmlEscape(currentRow.title) + "</b> - " + Base.htmlEscape(currentRow.artists)
                debug.log("Now playing : " + currentRow.link)
            }

            itemDelegate: Rectangle{
                implicitHeight: 35
                color : "transparent"
                border.width : 1
                border.color : styleData.selected ? "transparent" : Qt.lighter(Base.Color.Disabled.Light,1.2)
                Label {
                    id : parentLabel
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    color: Base.Color.BlackDark
                    elide: Text.ElideRight
                    text: (styleData.column===4) ? infoTable.formatSite(styleData.value) : styleData.value
                    states: [
                        State {
                            name: "selected"
                            when : styleData.selected
                            PropertyChanges {target: parentLabel; color : Base.Color.White}
                        }
                    ]
                    transitions: Transition {
                            PropertyAnimation { properties: "color"; easing.type: Easing.InOutQuad; duration: 300 }
                    }
                }

            }


            onDoubleClicked: {
                // prevent shuffle
                var currentSuffleState = audioPlayer.shuffleMode
                audioPlayer.shuffleMode = false
                playAtRow(infoTable.currentRow)
                audioPlayer.shuffleMode = currentSuffleState
            }

        }

    }


    DNADebug{
        id : debug
        frameVisible : true
        highlightOnFocus : true
//        anchors.centerIn: parent
        anchors.right: parent.right
        anchors.top : parent.top
        width: 200
        height: 100
        dumpMode: true
        Component.onCompleted: debug.log("This is very long text. it is supposed to extend and test the horizontal handle bar")
    }
}
