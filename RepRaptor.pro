#-------------------------------------------------
#
# Project created by QtCreator 2015-02-26T16:14:20
# Licenced on terms of GNU GPL v2 licence
#
#-------------------------------------------------

QT       += core gui serialport

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET      = RepRaptor
TEMPLATE    = app
CONFIG      += static

PROGRAMM_PATH  += \
    $$PWD/src \
    $$PWD/src/ui
INCLUDEPATH += $$PROGRAMM_PATH
DEPENDPATH  += $$PROGRAMM_PATH

linux {
    contains(QMAKE_HOST.arch, arm.*):{
        message(raspberry)
        OBJECTS_DIR = temp/obj
        MOC_DIR     = temp/moc
        UI_DIR      = temp/ui
        RCC_DIR     = temp/rc
    }else{
        # message(linux)
        OBJECTS_DIR = /dev/shm/$$TARGET/obj
        MOC_DIR     = /dev/shm/$$TARGET/moc
        UI_DIR      = /dev/shm/$$TARGET/ui
        RCC_DIR     = /dev/shm/$$TARGET/rc
    }
}

macx {
    OBJECTS_DIR = build/obj
    MOC_DIR     = build/moc
    UI_DIR      = build/ui
    RCC_DIR     = build/rc
}

android {
    OBJECTS_DIR = build/obj
    MOC_DIR     = build/moc
    UI_DIR      = build/ui
    RCC_DIR     = build/rc
}

win32 {
    TEMP_PATH = "E:"
    OBJECTS_DIR = $$TEMP_PATH/$$TARGET/obj
    MOC_DIR     = $$TEMP_PATH/$$TARGET/moc
    UI_DIR      = $$TEMP_PATH/$$TARGET/ui
    RCC_DIR     = $$TEMP_PATH/$$TARGET/rc

    CONFIG -= debug_and_release #debug_and_release_target
    CONFIG += no_fixpath

    DEFINES += WIN32_LEAN_AND_MEAN
}

unix {
    #VARIABLES
    isEmpty(PREFIX) {
        PREFIX = /usr
    }
    BINDIR  = $$PREFIX/bin
    DATADIR = $PREFIX/share

    DEFINES += DATADIR=\\\"$$DATADIR\\\" PKGDATADIR=\\\"$$PKGDATADIR\\\"

    #MAKE INSTALL

    INSTALLS += target desktop icon

    target.path = $$BINDIR

    desktop.path = $$DATADIR/applications
    desktop.files += $${TARGET}.desktop

    icon.path = $$DATADIR/icons
    icon.files += icons/repraptor.png
}

DESTDIR = bin

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    settingswindow.cpp \
    aboutwindow.cpp \
    errorwindow.cpp \
    erroricon.cpp \
    sdwindow.cpp \
    eepromwindow.cpp \
    parser.cpp \
    sender.cpp

HEADERS  += \
    mainwindow.h \
    settingswindow.h \
    aboutwindow.h \
    errorwindow.h \
    erroricon.h \
    sdwindow.h \
    repraptor.h \
    eepromwindow.h \
    parser.h \
    sender.h

FORMS    += \
    mainwindow.ui \
    settingswindow.ui \
    aboutwindow.ui \
    errorwindow.ui \
    sdwindow.ui \
    eepromwindow.ui

RESOURCES += \
    graphics.qrc

DISTFILES += \
    LICENCE \
    README.md \
    RepRaptor.desktop \
    .travis.yml

VPATH = $$INCLUDEPATH
