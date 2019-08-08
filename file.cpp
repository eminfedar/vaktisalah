#include "file.h"
#include <QFile>
#include <QStandardPaths>
#include <QDir>
File::File(QObject *parent) : QObject(parent)
{

}

QString File::readFile(QString file, QString homeFolders) const{
    // Checking if parameters are null or empty.
    if(file.isEmpty() || file.isNull()){
        return tr("ERR: 1st parameter is empty or null.") + " (file)";
    }

    // Creating the file and opening.
    QString absolutePath = "";

    if (homeFolders == "config") {
        absolutePath = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation) + "/";
        QDir().mkpath(absolutePath);
    }
    QFile fi((absolutePath + file));

    if(!fi.open(QFile::ReadOnly | QFile::Text))
        return tr("ERR: Can't access the file\n(maybe some program using it):") + file;

    // Reading.
    QString content = fi.readAll();
    fi.close();

    return content;
}

QString File::saveFile(QString file, QString data, QString homeFolders) const{
    // Checking if parameters are null or empty.
    if(file.isEmpty() || file.isNull()){
        return tr("ERR: 1st parameter is empty or null.") + " (file)";
    }

    QString absolutePath = "";

    if (homeFolders == "config") {
        absolutePath = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation) + "/";
        QDir().mkpath(absolutePath);
    }
    QFile fi((absolutePath + file));
    if(!fi.open(QFile::WriteOnly | QFile::Text))
        return tr("ERR: Can't access the file\n(maybe some program using it):") + file;

    // Write the file.
    fi.write(data.toUtf8());
    fi.close();

    return "";
}
