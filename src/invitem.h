#ifndef INVITEM_H
#define INVITEM_H

#include <QJsonObject>
#include <QObject>
#include "item.h"

class InvItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(qint32 amount READ getAmount WRITE setAmount NOTIFY amountChanged)
    Q_PROPERTY(QString icon READ getIcon NOTIFY iconChanged)
    Q_PROPERTY(QString color READ getColor NOTIFY colorChanged)
    Q_PROPERTY(QString description READ getDescription NOTIFY descriptionChanged)
public:
    explicit InvItem(QObject *parent = 0);
    InvItem(QString name, qint32 amount);
    InvItem(const InvItem & other);
    InvItem & operator=(const InvItem & copy);
    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

    void setItem(Item item);

    QString getName();
    void setName(QString name);

    QString getIcon();
    QString getColor();
    QString getDescription();

    qint32 getAmount();
    void setAmount(qint32 amount);
signals:
    void itemChanged();
    void amountChanged();
    void nameChanged();
    void iconChanged();
    void colorChanged();
    void descriptionChanged();
public slots:

private:
    QString mName;
    QString mIcon;
    QString mColor;
    QString mDescription;
    qint32 mAmount;
};

#endif // INVITEM_H
