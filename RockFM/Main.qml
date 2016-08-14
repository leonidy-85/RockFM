import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Pickers 1.3
import Qt.labs.settings 1.0
//import RockFM 1.0
import QtMultimedia 5.4

MainView {
    objectName: "mainView"
    applicationName: "RockFM"
    theme.name: "Ubuntu.Components.Themes.SuruDark"

    width: units.gu(100)
    height: units.gu(75)

    Tabs {
        id: tabs
        Tab {
            id: main
            title: "RockFM"

            Page {
                title: i18n.tr("Rock FM")

                Column {
                    id: pageLayout

                    anchors {
                        fill: parent
                    }

                    spacing: units.gu(3)

                    MediaPlayer {
                        id: mediaPlayer
                        source: "http://nashe1.hostingradio.ru/rock-128.mp3"
                        property string title: !!metaData.title ?
                                                   qsTr("%1").arg(metaData.title) :
                                                   metaData.title

                    }




                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "rock.png"
                    }



                    //                    Label {
                    //                        id: currentStation
                    //                        font.pixelSize: units.gu(1.8)
                    //                       // width: parent.width
                    //                        anchors.horizontalCenter:parent.horizontalCenter
                    //                        text: "Stop"
                    //                    }



                    Row {
                        spacing: units.gu(2)
                        anchors.horizontalCenter: parent.horizontalCenter

                        Button {
                            objectName: "Play"
                            width: units.gu(12)
                            text: i18n.tr("Play ")
                            iconSource: "play.png"
                            onClicked: {
                                mediaPlayer.play()
                                console.log(mediaPlayer.title)
                            }

                        }

                        Button {
                            objectName: "Stop"
                            width: units.gu(12)

                            text: i18n.tr("Stop ")
                            iconSource: "stop.png"
                            onClicked: {
                                mediaPlayer.stop()
                            }
                        }
                    }
                }
            }
        }

        Tab {
            id: about
            title: i18n.tr("About")
            page: Loader {
                parent: config
                anchors.fill: parent
                source: (tabs.selectedTab === about) ? Qt.resolvedUrl("about.qml") : ""
            }
        }

    }
}
