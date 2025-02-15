﻿#ifndef CATHTTPPARAM_H
#define CATHTTPPARAM_H

#include <QObject>
#include <QHttpPart>
#include <QVector>

class CatHttpParam : public QObject
{
    Q_OBJECT
public:
    explicit CatHttpParam(QObject *parent = nullptr);

    QHttpPart AddHttpParam(const QString &key, const QString &value);
    QHttpPart AddHttpImageParam(QHttpMultiPart *multipart, const QString &key = "iamge", const QString &imagepath = "", const QString &type = "image/png");
    QVector<QHttpPart> GetHttpParams();
    void ClearParams();

private:
    QVector<QHttpPart> m_yParts;
};

#endif // CATHTTPPARAM_H
