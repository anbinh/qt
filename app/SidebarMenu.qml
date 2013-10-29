import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import "../styles/base.js" as Base
import "../styles"

Rectangle{
    id : rootRect
    z : -1
    width : 200
    height: submenu1.height + submenu2.height + submenu3.height+ submenu4.height  + 10 // 10 is offset
    color : "transparent"
    ExclusiveGroup { id: group }

    signal clicked(string section, string title, bool checked)

    function mainSection(){
        var data = [{
                        "name" : "home",
                        "title" : "home",
                        "icon" : "home.png"
                    },
                    {
                        "name" : "music",
                        "title" : "music",
                        "icon" : "music.png"
                    },
                    {
                        "name" : "songs",
                        "title" : "songs",
                        "icon" : "note.png"
                    },
                    {
                        "name" : "albums",
                        "title" : "albums",
                        "icon" : "albums.png"
                    },
                    {
                        "name" : "videos",
                        "title" : "videos",
                        "icon" : "film.png"
                    }
                ]
        return data;
    }

    function getGenres(){

        var topics = ["Pop","Rock","R&B","Rap","Hiphop","Classical","Alternatives","Instrumental","More..."]

        return topics
    }
    function getLanguages(){
        var languages=["Vietnamese","English","French","Korean","Japanese","Chinese","Spanish","More..."]
        return languages
    }
    function getPlaylists(){
        var playlists=[
                    "Best song collections v1",
                    "Best songs ever",
                    "Collection of shakira",
                    "Best complilation",
                    "100 best songs of the Beatles - Today"
                ]
        return playlists
    }

    ListModel {
        id : mylist
        ListElement {
            section: "main"
            title: "Home"
            icon : "images/home.png"
        }
        ListElement {
            section: "main"
            title: "Songs"
            icon : "images/note.png"
        }
        ListElement {
            section: "main"
            title: "Albums"
            icon : "images/albums.png"
        }
        ListElement {
            section: "main"
            title: "Videos"
            icon : "images/film.png"
        }
        ListElement {
            section: "genres"
            title: "pop"
            icon : ""
        }
        ListElement {
            section: "main"
            title: "rock"
            icon : ""
        }
        ListElement {
            section: "main"
            title: "rap"
            icon : ""
        }
        ListElement {
            section: "main"
            title: "hiphop"
            icon : ""
        }
        ListElement {
            section: "main"
            title: "R&B"
            icon : ""
        }
        ListElement {
            section: "playlist"
            title: "never say never"
            icon : ""
        }
        ListElement {
            section: "playlist"
            title: "never say never"
            icon : ""
        }
        ListElement {
            section: "playlist"
            title: "never say never"
            icon : ""
        }
    }

    SidebarSubmenu{
        id : submenu1
        width : rootRect.width
        sectionText: "Main section"
        model : parent.mainSection()
        source : "images/home.png"
        delegate : SideItem{
            width : rootRect.width
            text : modelData.title
            source : "images/" + modelData.icon
            iconEnable: true
            exclusiveGroup: group
            onClicked : {
                rootRect.clicked("anbin",modelData,checked)
            }

        }
    }
    SidebarSubmenu{
        id : submenu2
        width : rootRect.width
        anchors.top : submenu1.bottom
        sectionText: "Genres"
        model : parent.getGenres()
        source : "images/fire.png"
        delegate : SideItem{
            width : rootRect.width
            text : modelData
            source : "images/playlist.png"
            iconEnable: false
            exclusiveGroup: group
            onClicked : {
                rootRect.clicked("anbin",modelData,checked)
            }

        }
    }
    SidebarSubmenu{
        id : submenu3
        width : rootRect.width
        anchors.top : submenu2.bottom
        sectionText: "Languages"
        source : "images/translate.png"
        model : parent.getLanguages()
        delegate : SideItem{
            width : rootRect.width
            text : modelData
            source : "images/note.png"
            iconEnable: false
            exclusiveGroup: group
            onClicked : {
                rootRect.clicked("anbin",modelData,checked)
            }
        }
    }
    SidebarSubmenu{
        id : submenu4
        width : rootRect.width
        anchors.top : submenu3.bottom
        sectionText: "Playlist"
        source : "images/playlist.png"
        model : parent.getPlaylists()

        delegate : SideItem{
//            maxWidth: rootRect.maxWidth
            width : rootRect.width
            leftMarginText : 30
            text : modelData
            source : "images/note.png"
            iconEnable: false
            exclusiveGroup: group
            onClicked : {
                rootRect.clicked("anbin",modelData,checked)
            }

        }
    }
}
