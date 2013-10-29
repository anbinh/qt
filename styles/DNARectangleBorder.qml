import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0

import "base.js" as Base


// Does not work well with all built-in properties: such as opacity
DNARectangle{
    id : root

    property color bgColor : Base.Color.White
    color : border.color

    DNARectangle{
        width: parent.width - parent.border.width*2
        height: parent.height- parent.border.width*2
        radius : parent.radius*2/3
        color : parent.bgColor
        x : parent.border.width
        y : parent.border.width
        hasTopLeftRadius : parent.hasTopLeftRadius
        hasTopRightRadius : parent.hasTopRightRadius
        hasBottomLeftRadius : parent.hasBottomLeftRadius
        hasBottomRightRadius : parent.hasBottomRightRadius
    }


}
