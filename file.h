#ifndef FILE_H
#define FILE_H

#include <QObject>

class File : public QObject
{
    Q_OBJECT
public:
    explicit File(QObject *parent = nullptr);

signals:

public slots:
    QString readFile(QString path, QString homeFolders = "") const;
    QString saveFile(QString path, QString data, QString homeFolders = "") const;
};

#endif // FILE_H
