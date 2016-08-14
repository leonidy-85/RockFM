TEMPLATE = aux
TARGET = RockFM

RESOURCES += RockFM.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  RockFM.apparmor \
               RockFM.desktop \
               RockFM.png \
               rock.png \
               play.png \
               rocklogo.png \
               stop.png



AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES}

#specify where the qml/js files are installed to
qml_files.path = /RockFM
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /RockFM
config_files.files += $${CONF_FILES}

INSTALLS+=config_files qml_files

DISTFILES += \
    about.qml

