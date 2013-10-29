var tooltip;
function show(parent,text,position){
    var component = Qt.createComponent("../DNATooltip.qml");

    tooltip = component.createObject(parent);
    tooltip.text = text;
    tooltip.width = text.length*7
    tooltip.height = 20
    if (( position === "up") || ( position === "top")){
                tooltip.anchors.bottom = parent.top
                tooltip.anchors.horizontalCenter = parent.horizontalCenter
        tooltip.style = "down"
            }
    if (( position === "down") || ( position === "bottom")){
        tooltip.anchors.top = parent.bottom
        tooltip.anchors.horizontalCenter = parent.horizontalCenter
        tooltip.style = "up"
    }
    if ( position === "left"){
        tooltip.anchors.right = parent.left
        tooltip.anchors.verticalCenter = parent.verticalCenter
        tooltip.style = "right"
    }
    if ( position === "right"){
        tooltip.anchors.left = parent.right
        tooltip.anchors.verticalCenter = parent.verticalCenter
        tooltip.style = "left"
    }



    tooltip.pointerSize = 5
    tooltip.textLeftRightMargin = 5
    tooltip.multiLinesMode = false


}
function close(){
    if ((tooltip !== undefined) && (tooltip.destroy)){
        tooltip.destroy();
    }
}
