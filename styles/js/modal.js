var modal;
function show(parent,title,content,width){
    var component = Qt.createComponent("../DNAModal.qml");

    modal = component.createObject(parent);
    modal.anchors.centerIn = parent;
    if (width !== undefined){
        modal.width = width;
    }
    modal.title = title;
    modal.content = content;

}
function close(){
    if ((modal !== undefined) && (modal.destroy)){
        modal.destroy();
    }
}

