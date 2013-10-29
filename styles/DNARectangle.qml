import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0

import "base.js" as Base


// Does not work well with all built-in properties: such as opacity
Rectangle{
    id : root
    property bool hasTopLeftRadius : true
    property bool hasTopRightRadius : true
    property bool hasBottomLeftRadius : true
    property bool hasBottomRightRadius : true
    Rectangle {
        id : rectTopLeft
        color : parent.color
        width : parent.radius
        height : parent.radius
        visible : (parent.hasTopLeftRadius) ? false : true
        opacity : parent.opacity
        x : 0
        y : 0
    }
    Rectangle {
        id : rectTopRight
        color : parent.color
        width : parent.radius
        height : parent.radius
        visible : (parent.hasTopRightRadius) ? false : true
        opacity : parent.opacity
        x : parent.width - width
        y : 0
    }
    Rectangle {
        id : rectBottomLeft
        color : parent.color
        width : parent.radius
        height : parent.radius
        visible : (parent.hasBottomLeftRadius) ? false : true
        opacity : parent.opacity
        x : 0
        y : parent.height - height
    }
    Rectangle {
        id : rectBottomRight
        color : parent.color
        width : parent.radius
        height : parent.radius
        visible : (parent.hasBottomRightRadius) ? false : true
        opacity : parent.opacity
        x : parent.width - width
        y : parent.height - height
    }


}
