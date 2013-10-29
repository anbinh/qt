QT += qml quick
TARGET = musicapp
qtHaveModule(widgets) {
    QT += widgets
}

ICON = icon.icns

include(src/src.pri)

OTHER_FILES += \
    main.qml

RESOURCES += \
    resources.qrc
