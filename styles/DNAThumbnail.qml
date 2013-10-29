import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
//import QtGraphicalEffects 1.0

import "base.js" as Base

Rectangle{
    id : root
    border.width: 1
    border.color: Base.Color.Disabled.Value
    width: 150
    height : 150
    radius : 4
    property string imageSource : "http://www.arnoldimaging.com/wp-content/uploads/INT_Lobby1.jpg"
    Image {
        id : img
        source: parent.imageSource
        anchors.centerIn: parent
        width: 0
        height: 0
        Behavior on height{
            NumberAnimation{duration: 100}
        }
        Behavior on width{
            NumberAnimation{duration: 100}
        }
    }
    DNAProgressBar{
        id : progressbar
        anchors.centerIn: parent
        width: parent.width - 10*2
        height: 2
        value : img.progress*100
    }
    Label{
        id : loadingTitle
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        y : parent.height/2 - 18
        font.pointSize: 11
        color : Base.Color.GreyDark
        text : "Loading..."
    }

    states : [
        State { name: 'loaded'; when: img.status == Image.Ready
            PropertyChanges {target: progressbar;opacity : 0}
            PropertyChanges {target: loadingTitle;opacity : 0}
            PropertyChanges {target: img;width : parent.width - 10}
            PropertyChanges {target: img;height : parent.height - 10}
        },
        State { name: 'loading'; when: img.status == Image.Loading
            PropertyChanges {target: progressbar;opacity : 1}
        },
        State { name: 'null'; when: img.status == Image.Null  },
        State { name: 'error'; when: img.status == Image.Error  }
    ]


}
