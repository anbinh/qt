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
        anchors.fill : parent
        Label{
            text : "Table View"
        }
        ListModel {
           id: libraryModel
           ListElement{ title: "A Masterpiece" ; author: "Gabriel "; birthday : "14-05-1989" }
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
            id : infoTable
            model : libraryModel
            anchors.fill : parent
            TableViewColumn{ role: "title"  ; title: "Title" ; width: 100 }
            TableViewColumn{ role: "author" ; title: "Author" ; width: 250 }
            TableViewColumn{ role: "birthday" ; title: "Birthday" ; width: 250 }
            onClicked: {
                console.log(libraryModel.get(infoTable.currentRow).author)
            }
        }

    }



}
