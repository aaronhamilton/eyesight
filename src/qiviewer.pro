VERSION = 0.5.0
TEMPLATE = app
DEFINES += APP_VERSION="$$VERSION"
DEPENDPATH += . translations
CONFIG  += release
TARGET = qiviewer

# Input
HEADERS += aboutdialog.h \
           configdialog.h \
           fileproperties.h \
           mainwindow.h \
           toolbaredit.h \
           imagewidget.h \
           zoomwidget.h \
           settings.h \
	   eggsdialog.h \
	   fileutils.h \
    gotodialog.h \
    actionsmanager.h \
    actiondata.h \
    edittoolbar.h
SOURCES += aboutdialog.cpp \
           configdialog.cpp \
           fileproperties.cpp \
           mainwindow.cpp \
           toolbaredit.cpp \
           main.cpp \
           imagewidget.cpp \
           zoomwidget.cpp \
           settings.cpp \
	   eggsdialog.cpp \
	   fileutils.cpp \
    gotodialog.cpp \
    actionsmanager.cpp \
    actiondata.cpp \
    edittoolbar.cpp
FORMS += \
    forms/aboutdialog.ui \
    forms/fileproperties.ui \
    forms/configdialog.ui \
    forms/eggsdialog.ui \
    forms/gotodialog.ui \
    forms/toolbaredit.ui \
    forms/edittoolbar.ui
RESOURCES += imageviewer.qrc
DESTDIR = build/target/
OBJECTS_DIR = build/obj/
FORMS_DIR = build/forms/
MOC_DIR = build/moc/
RCC_DIR = build/rcc/

enable-webp {
    message(This feature isn't ready yet, use it carefully!)
    # rules to execute when myfeature IS defined:
    DEFINES += WEBP_SUPPORT
    INCLUDEPATH += . ./3rdparty/webp
    HEADERS += webpdecoder.h \
               3rdparty/webp/dec/bits.h \
               3rdparty/webp/dec/vp8i.h \
               3rdparty/webp/dec/yuv.h \
               3rdparty/webp/webp/decode.h \
               3rdparty/webp/webp/decode_vp8.h \
               3rdparty/webp/webp/encode.h \
               3rdparty/webp/webp/types.h
    SOURCES += webpdecoder.cpp \
               3rdparty/webp/dec/bits.c \
               3rdparty/webp/dec/dsp.c \
               3rdparty/webp/dec/frame.c \
               3rdparty/webp/dec/quant.c \
               3rdparty/webp/dec/tree.c \
               3rdparty/webp/dec/vp8.c \
               3rdparty/webp/dec/webp.c \
               3rdparty/webp/dec/yuv.c
}

# Tell Qt Linguist that we use UTF-8 strings in our sources
TRANSLATIONS += translations/es_AR.ts \
                translations/es_ES.ts \
		translations/el.ts
CODECFORTR = UTF-8
CODECFORSRC = UTF-8
include(translations/locale.pri)

isEmpty(PREFIX):PREFIX = /usr
BINDIR = $$PREFIX/bin
DATADIR = $$PREFIX/share
PKGDATADIR = $$DATADIR/qiviewer
DEFINES += DATADIR=\\\"$$DATADIR\\\" \
    PKGDATADIR=\\\"$$PKGDATADIR\\\" \
    PKGVERSION=\\\"$$VERSION\\\"

INSTALLS += target translations desktop
target.path = $$BINDIR

translations.path = $$PKGDATADIR
translations.files += $$DESTDIR/locale

desktop.files = qiviewer.desktop 
desktop.path = $$PREFIX/share/applications

!unix: RESOURCES += oxygen.qrc
#os2: RC_FILE = qiviewer_os2.rc
#win32: RC_FILE = qiviewer_win.rc still not ready
