import QtQuick 2.1
import QtQuick.Controls 1.0
import "../styles/base.js" as Base
import "../styles"


DNATextArea{
    property int count : 0
    property bool dumpMode : false
    function log(str){
        if (!dumpMode) {
            count +=1
            text = count + ": " + str + "\n" + text
        }  else visible = false
    }
}

