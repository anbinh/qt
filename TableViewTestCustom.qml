import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import "styles/base.js" as Base
import "styles"

Item{
    anchors.fill: parent
    anchors.margins: 20
    ColumnLayout {
        anchors.fill: parent
        Label{
            text : "Table View"
        }
        ListModel {
           id: libraryModel
           ListElement{ title: "A Masterpiece" ; author: "Gabriel This is a  extremely very long name for eliding testing"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
           ListElement{ title: "A Masterpiece" ; author: "Gabriel"; birthday : "14-05-1989" }
           ListElement{ title: "Brilliance"    ; author: "Jens"; birthday : "14-05-1989" }
           ListElement{ title: "Outstanding"   ; author: "Frederik"; birthday : "14-05-1989" }
        }
        DNATableView{
            anchors.fill : parent
            model : libraryModel
            TableViewColumn{ role: "title"  ; title: "Title"  }
            TableViewColumn{ role: "author" ; title: "Author" }
            TableViewColumn{ role: "birthday" ; title: "Birthday"  }
            itemDelegate: Label{
                text : styleData.value
                color : styleData.selected ? Base.Color.White : styleData.textColor
                elide : styleData.elideMode
                verticalAlignment : Text.AlignVCenter
                horizontalAlignment: (styleData.column===2) ? Text.AlignHCenter :styleData.textAlignment
            }
            sortIndicatorVisible: true
            sortIndicatorColumn: 0
            sortIndicatorOrder : Qt.AscendingOrder
        }

    }



}
