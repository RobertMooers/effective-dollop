#ifndef ITEM_H
#define ITEM_H

#include <QJsonObject>
#include <QObject>

class Item : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName NOTIFY nameChanged)
    Q_PROPERTY(QString icon READ getIcon NOTIFY iconChanged)
    Q_PROPERTY(QString color READ getColor NOTIFY colorChanged)
    Q_PROPERTY(QString description READ getDescription NOTIFY descriptionChanged)

public:
    explicit Item(QObject *parent = 0);
    Item(QString name, QString icon, QString color, QString description);
    Item(const Item & other);
    Item & operator=(const Item &);
    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

    QString getName();
    QString getIcon();
    QString getColor();
    QString getDescription();
signals:
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
};

#endif // ITEM_H
