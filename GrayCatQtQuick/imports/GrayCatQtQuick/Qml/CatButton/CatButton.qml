﻿import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12
//import "../CatBasics"

Button{
    id: root
    readonly property string version: "1.0"
    //property alias backgroundRectangle: backgroundRectangle

    property alias tipText: catbasictooltip.text
    property alias tipItem: catbasictooltip
    property alias tipVisible: catbasictooltip.visible
    property alias tipDelay: catbasictooltip.delay
    property alias tipTimeout: catbasictooltip.timeout
    property alias tipFont: catbasictooltip.font
    property alias tipTextColor: catbasictooltiptext.color
    property alias tipBackground: tooltiprectangle
    property alias mouseArea: mousearea
    property bool selected: false
    signal buttonEntered()
    signal buttonExited()

    /*property string btnImgNormal
    property string btnImgHovered
    property string btnImgPressed
    property string btnImgDisbaled

    property color backgroundColor: "transparent"
    property color backgroundColor_pressed
    property color backgroundColor_hovered*/

    ToolTip {
        id: catbasictooltip
        visible: root.hovered && String(text).length
        delay: 500
        contentItem: Text {
            id: catbasictooltiptext
            text: catbasictooltip.text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: catbasictooltip.font.family
            font.pixelSize: catbasictooltip.font.pixelSize
            elide: Text.ElideRight
            //color: catbasictooltip.color
        }

        background: Rectangle {
            color: "transparent"
            Rectangle {
                id: tooltiprectangle
                anchors.fill: parent
            }
            DropShadow {
                anchors.fill: tooltiprectangle
                horizontalOffset: 2
                verticalOffset: 2
                radius: 4.0
                samples: 8
                color: "#50000000"
                source: tooltiprectangle
            }
        }
    }

    /*background: CatRectangle {
        id: backgroundRectangle
        width: root.width
        height: root.height
    }*/

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
        //鼠标图标， hovered 或者 pressed时显示此图标
        cursorShape: enabled ? Qt.PointingHandCursor : Qt.ForbiddenCursor
        onDoubleClicked: { mouse.accepted = false;}
        onPositionChanged: { mouse.accepted = false;}
        onPressed:  {  mouse.accepted = false; }
        onPressAndHold: { mouse.accepted = false; }
        onClicked:  { mouse.accepted = false;}
        onReleased: { mouse.accepted = false;}
        onWheel: { wheel.accepted = false; }
        onEntered: { buttonEntered() }
        onExited: { buttonExited() }
    }
}
