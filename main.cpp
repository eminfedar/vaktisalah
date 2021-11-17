#include <QApplication>
#include <QQmlApplicationEngine>
#include "file.h"
#include <QSystemTrayIcon>
#include <QAction>
#include <QMenu>
#include <QQmlContext>
#include <QDebug>
#include <QQuickWindow>
#include <QTranslator>
#include <QLocale>

void addQMLApis() {
    qmlRegisterType<File>("org.eminfedar.file", 1, 0, "File");

    qputenv("QML_DISABLE_DISTANCEFIELD", "1");
}

void addSysTrayIcon(QQmlApplicationEngine* engine) {
    QObject *root = 0;
    if (engine->rootObjects().size() > 0)
    {
        root = engine->rootObjects().at(0);

        QAction *restoreAction = new QAction(QObject::tr("Show / Hide"), root);
        root->connect(restoreAction, &QAction::triggered, [=](){
            root->setProperty("visible", !root->property("visible").toBool());
        });
        QAction *quitAction = new QAction(QObject::tr("Exit"), root);
        root->connect(quitAction, SIGNAL(triggered()), qApp, SLOT(quit()));

        QMenu *trayIconMenu = new QMenu();
        trayIconMenu->addAction(restoreAction);
        trayIconMenu->addSeparator();
        trayIconMenu->addAction(quitAction);

        QSystemTrayIcon *trayIcon = new QSystemTrayIcon(root);
        trayIcon->setContextMenu(trayIconMenu);
        trayIcon->setIcon(QIcon(":/icons/vaktisalah.png"));
        trayIcon->show();
        trayIcon->connect(trayIcon, &QSystemTrayIcon::activated, [=](QSystemTrayIcon::ActivationReason reason){
            if ( reason == QSystemTrayIcon::Trigger || reason == QSystemTrayIcon::DoubleClick){
                root->setProperty("visible", !root->property("visible").toBool());
            }
        });
    }
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Get Translations
    QTranslator t;
    if (t.load(":/translations/vaktisalah_" + QLocale::system().name())) {
        app.installTranslator(&t);
    } else {
        qDebug() << "Could not load the translation";
    }

    // Add QML Apis
    addQMLApis();

    // Little Styling
    app.setStyleSheet("QMenu{"
                      "background: #292929;"
                      "color: #FFFFFF;"
                      "}"
                      ""
                      "QMenu::item:selected{"
                      "background-color: rgb(0, 150, 0);"
                      "}"
                      ""
                      "QMenu::item:disabled{"
                      "color: #BBBBBB;"
                      "background-color: #393939;"
                      "}");
    app.setWindowIcon(QIcon(":/icons/vaktisalah.png"));

    // QML Engine
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("iconTray", QIcon(":/icons/vaktisalah.png"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QQuickWindow::setTextRenderType(QQuickWindow::NativeTextRendering);

    addSysTrayIcon(&engine);

    return app.exec();
}
