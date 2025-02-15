﻿import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "../../"


Rectangle {
    id: defaultlayout
    color: "transparent"
    RowLayout {
        id: defaultRowlayout
        anchors.fill: parent
        spacing: 10

        DefaultListView {
            Layout.preferredWidth: 300
            Layout.fillHeight: true
            color: "transparent"
            /*border.color: "#4E4E4E"
            border.width: 1
            radius: 5*/
            onUpdateDemo: {
                demonstrationview.updatedemo(demoname, qmlsource)
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
            DemonstrationView {
                id: demonstrationview
                anchors.fill: parent
                anchors.margins: 5
                color: ProjectObject.defaultRectangleColor
                radius: 5
            }
            DropShadow {
                anchors.fill: demonstrationview
                horizontalOffset: 0
                verticalOffset: 0
                radius: 5.0
                samples: 10
                color: ProjectObject.defaultShadowColor
                source: demonstrationview
            }
        }
    }

    /*function updatedemo(demoname, index, qmlsource)
    {
        demonstrationview.updatedemo(demoname, index, qmlsource)
    }*/
}
