#include <QApplication>
#include <QQmlApplicationEngine>
#include "file.h"
#include <QSystemTrayIcon>
#include <QQmlContext>

Q_DECLARE_METATYPE(QSystemTrayIcon::ActivationReason)

void addQMLApis() {
    qmlRegisterType<File>("org.eminfedar.file", 1, 0, "File");
    qmlRegisterType<QSystemTrayIcon>("systemtrayicon", 1, 0, "TrayIcon");
    qRegisterMetaType<QSystemTrayIcon::ActivationReason>("ActivationReason");
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    addQMLApis();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("iconTray", QIcon(":/img/back_icon.png"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
