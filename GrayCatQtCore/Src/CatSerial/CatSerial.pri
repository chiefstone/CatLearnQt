QT += serialport
if(contains(DEFINES,WEBASSEMBLY)) {
QT -= serialport
}

if(!contains(DEFINES,WEBASSEMBLY)) {
HEADERS += \
    $$PWD/CatSerial \
    $$PWD/CatSerialPort.h \
    $$PWD/MonitorSerial.h

SOURCES += \
    $$PWD/CatSerialPort.cpp \
    $$PWD/MonitorSerial.cpp

msvc {

HEADERS += \
    $$PWD/CatWinMonitorSerial.h \

SOURCES += \
    $$PWD/CatWinMonitorSerial.cpp \

}


INCLUDEPATH += $$PWD
}
