TEMPLATE = lib
CONFIG += plugin
QT -= gui
QT += core serialport qml

TARGET = $$qtLibraryTarget(samba_conn_serial)

DESTPATH = /qml/SAMBA/Connection/Serial

SOURCES += sambaconnectionserial.cpp
HEADERS += sambaconnectionserial.h

# include/link sambacommon library
INCLUDEPATH += $$PWD/../../../sambacommon
DEPENDPATH += $$PWD/../../../sambacommon
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../../../sambacommon/release/ -lsambacommon3
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../../../sambacommon/debug/ -lsambacommon3
else:unix:LIBS += -L$$OUT_PWD/../../../sambacommon/ -lsambacommon

# set RPATH on Linux
unix:!mac:{
    QMAKE_LFLAGS += '-Wl,-rpath,\'\$$ORIGIN/../../../../lib\''
    QMAKE_RPATH =
}

qml.files = qmldir \
    SerialConnection.qml

# install
target.path = $$DESTPATH
qml.path = $$DESTPATH
INSTALLS += target qml

OTHER_FILES += $$qml.files