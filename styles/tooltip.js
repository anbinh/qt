var tooltip;
function show(parent,text,style){
    var component = Qt.createComponent("../DNATooltip.qml");

    tooltip = component.createObject(parent);
    tooltip.anchors.centerIn = parent;
    tooltip.text = text;
    tooltip.width = text.length*7
    tooltip.height = 20
    tooltip.anchors.bottom = parent.top
    tooltip.anchors.horizontalCenter = parent.horizontalCenter
    tooltip.pointerSize = 5
    tooltip.textLeftRightMargin = 5
    tooltip.multiLinesMode = false

}
function close(){
    if ((tooltip !== undefined) && (tooltip.destroy)){
        tooltip.destroy();
    }
}
