﻿import QtQuick 2.9
import QtQuick.Controls 2.12

ToolTip {
    readonly property string version: "1.0"
    id: catbasictooltip
    contentItem: CatBasicsText {
        text: catbasictooltip.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: catbasictooltip.font.family
        font.pixelSize: catbasictooltip.font.pixelSize
        elide: Text.ElideRight
        color: catbasictooltip.color
    }

    background: Rectangle {
        id: tooltiprectangle
    }
}
