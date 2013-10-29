import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Private 1.0
import QtMultimedia 5.0
import "../styles/base.js" as Base
import "../styles/js/modal.js" as Modal
import "../styles"



DNAToolBar {
        id : player
        property alias source : audio.source
        property alias thumbnail : thumbnail.source
        property alias infoArea : infoArea.text
        height: 70
        signal playClicked(string status)
        signal rewindClicked
        signal forwardClicked
        signal replayClicked
        signal shuffleClicked
        signal volumeClicked
        signal seeking(double milisecs)
        property alias volume : volume.value
        property alias position : audio.position
        property alias errorString : audio.errorString
        property alias error : audio.error
        property alias status : audio.status
        property alias playbackState : audio.playbackState
        property alias seekable : audio.seekable
        property alias muted : audio.muted
        property alias availability : audio.availability
        property alias autoLoad : audio.autoLoad
        property alias autoPlay : audio.autoPlay

        property alias progressBar : progressBar
        property alias audio : audio
        property bool shuffleMode : false

        function play(src){
            if ((src!=="") || (src!==undefined)){
                audio.source = src
                audio.play()
            }


        }
        function stop(){
            audio.stop()
        }
        function pause(){
            audio.pause()
        }

        property int topAnchorItem: 22

        RowLayout {
            anchors.fill: parent
            Audio {
                id: audio
                volume : volume.value/100
                source : "http://m.mp3.zing.vn/xml/song-load/MjAxMyUyRjEwJTJGMjElMkY0JTJGNiUyRjQ2MmIxM2Q2Yjg4NWQ2NTdmNmY1NGVhYjUzYzBhNzllLm1wMyU3QzI="
//                source : "default.mp3"
                onBufferProgressChanged: {
                    console.log("bufferProgress:" + bufferProgress)
                }
                onPositionChanged: {
                    progressBar.value = audio.position
                }
            }

            // Audio thumbnail
            Image{
                id : thumbnail
                width : 54
                height: 54
                sourceSize.width : 54
                sourceSize.height: 54
            }

            // Audio infomation
//            ColumnLayout{

//                Label {
//                    id : title
//                    text : "Today is tomorrow"
//                    font.pointSize: 11
//                    color : Base.Color.Black
//                    elide : Text.ElideRight
//                    Layout.maximumWidth: 150
//                }
//                Label {
//                    id : artist
//                    text : "Christina Button"
//                    font.pointSize: 11
//                    color : Base.Color.BlackDark
//                    elide : Text.ElideRight
//                    Layout.maximumWidth: 150
//                }
//            }

            // Rewind
            DNAToolButton {
                anchors.top : parent.top
                anchors.topMargin: player.topAnchorItem
                tooltipText : "Rewind to previous item"
                iconSource: "../styles/images/rewind.png"
                onClicked: {
                    player.rewindClicked()
                }
            }
            // PLay
            DNAToolButton {
                anchors.top : parent.top
                anchors.topMargin: player.topAnchorItem
               id : play
               tooltipText : "Nhấn vào đây để chạy"
                iconSource: (audio.playbackState===Audio.PlayingState) ? "../styles/images/pause.png" : "../styles/images/play.png"
                onClicked: {
                    if (audio.playbackState===Audio.PlayingState) {
                        audio.pause()
                    } else if (audio.playbackState===Audio.PausedState){
                        audio.play()
                    } else {
                        console.log("special case in AudioPlayer.qml -----")
                        console.log("force to play file -----" + audio.source)
                        audio.play()
                    }
                    player.playClicked(audio.playbackState)
                }


            }

            // Forward
            DNAToolButton {
                anchors.top : parent.top
                anchors.topMargin: player.topAnchorItem
                tooltipText : "Forward"
                iconSource: "../styles/images/forward.png"
                onClicked: {
                    player.forwardClicked()
                }
            }

            // Info of current song
            Rectangle{
                height: player.height - 12
                Layout.fillWidth: true
                radius : 4
                color : "transparent"
                Label {
                    id : infoArea
                    anchors.top : parent.top
                    anchors.topMargin : 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    text : "mmmmmmmmmmmmmm"
                    font.pixelSize: 12
                    font.family : Base.Font.family
                    color : Base.Color.BlackDark
                }

                // Audio progress bar
                AudioProgress{
                    id : progressBar
                    value : 0
                    anchors.top : infoArea.bottom
                    anchors.topMargin : 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    width : parent.width - 20
                    maximumValue: audio.duration
                    function seekNewValue(){
                        console.log("AUDIO SEEK ")
                        if (audio.seekable){
                            player.seeking(value)
                            audio.seek(value)
                        } else console.log("Cannot seek ")
                    }

                    onPressedChanged: {
                        if (!pressed) seekNewValue()
                    }
                    Keys.onRightPressed: seekNewValue()
                    Keys.onLeftPressed: seekNewValue()
                    WheelArea {
                        id: wheelarea
                        anchors.fill: parent
                        horizontalMinimumValue: progressBar.minimumValue
                        horizontalMaximumValue: progressBar.maximumValue
                        verticalMinimumValue: progressBar.minimumValue
                        verticalMaximumValue: progressBar.maximumValue
                        property int positionAtMinimum : 0
                        property int positionAtMaximum :  progressBar.width - progressBar.handleWidth
                        property real step: 5000 // 1 second

                        onVerticalWheelMoved: {
                            if (verticalDelta !== 0) {
                                var delta = Math.abs(verticalDelta)*step > progressBar.stepSize ? verticalDelta*step : verticalDelta/Math.abs(verticalDelta)*stepSize
                                audio.pause()
                                // only trigger when delta > 3s
                                if (Math.abs(delta)>=0){
                                    progressBar.value += delta
                                    //                                    console.log("vertical scroll: " + delta)
                                    progressBar.seekNewValue()

                                }
                                audio.play()
                            }
                        }
                        onHorizontalWheelMoved: {
                            if (horizontalDelta !== 0) {
                                var delta = Math.abs(horizontalDelta)*step > progressBar.stepSize ? horizontalDelta*step : horizontalDelta/Math.abs(horizontalDelta)*stepSize
                                audio.pause()
                                if (Math.abs(delta)>=0){
                                    progressBar.value += delta
                                    //                                    console.log("horizontal scroll: " + delta)
                                    progressBar.seekNewValue()
                                }
                                audio.play()


                            }
                        }
                    }
                }
            }

            // Current position/ total duration
            Label{
                anchors.top : parent.top
                anchors.topMargin: 34
                text : Base.Utils.formatTime(audio.position) + "/" + Base.Utils.formatTime(audio.duration)
                font.pointSize: 12
                font.bold: true
                color : Base.Color.BlackDark
                font.family : Base.Font.family
            }

            // replay button
            DNAToolButton {
                anchors.top : parent.top
                anchors.topMargin: player.topAnchorItem
                tooltipText : "Replay"
                iconSource: "../styles/images/retweet.png"
                onClicked: {
                    player.replayClicked()
                }

            }

            // Shuffle play
            DNAToolButton {
                anchors.top : parent.top
                anchors.topMargin: player.topAnchorItem
                tooltipText : player.shuffleMode ? "Shuffle: ON" : "Shuffle: OFF"
                iconSource: "../styles/images/random.png"
                onClicked: {
                    player.shuffleMode = !player.shuffleMode
                    player.shuffleClicked()
                    if (player.shuffleMode){
                        defaultBgColor  = Base.Color.Info.Value
                    } else defaultBgColor  = Base.Color.BlackDark
                }

            }

            // Volume buttom
            DNAToolButton {
                anchors.top : parent.top
                anchors.topMargin: player.topAnchorItem
                function getVolumeIcon(){
                    if (volume.value===0)
                        return "../styles/images/volume_lvl0.png"
                     else if (volume.value<=40)
                        return "../styles/images/volume_lvl1.png"
                    else if (volume.value<=80)
                        return "../styles/images/volume_lvl2.png"
                    else return "../styles/images/volume_lvl3.png"
                }
                tooltipText : "Change Volume"
                iconSource: getVolumeIcon()
                onClicked: {
                    if (volume.value===0){
                        volume.value=40
                    } else if (volume.value <= 40){
                        volume.value = 80
                    } else if (volume.value <= 80){
                        volume.value = 100
                    } else volume.value = 0

                    player.volumeClicked()
                }
            }
            AudioVolumeBar{
                id : volume
                anchors.top : parent.top
                anchors.topMargin: 31

                width: 100
                value : 20
            }
        }
    }

