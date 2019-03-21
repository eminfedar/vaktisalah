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
    QString readFile(QString path) const;
    QString saveFile(QString path, QString data) const;
};

#endif // FILE_H
