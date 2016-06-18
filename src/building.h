#ifndef BUILDING_H
#define BUILDING_H

#include <QObject>
#include <QJsonObject>
#include "invitem.h"

class Building : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName NOTIFY nameChanged)
    Q_PROPERTY(qint32 level READ getLevel WRITE setLevel NOTIFY levelChanged)
    Q_PROPERTY(QString description READ getDescription NOTIFY descriptionChanged)
    Q_PROPERTY(QString icon READ getIcon NOTIFY iconChanged)
    Q_PROPERTY(QString color READ getColor NOTIFY colorChanged)
    Q_PROPERTY(QString resourceToBuild READ getResourceToBuild NOTIFY resourceToBuildChanged)
    Q_PROPERTY(qint32 amountToBuild READ getAmountToBuild NOTIFY amountToBuildChanged)
    Q_PROPERTY(qreal multiplierToBuild READ getMultiplierToBuild NOTIFY multiplierToBuildChanged)

    Q_PROPERTY(QString resourceTaken READ getResourceTaken NOTIFY resourceTakenChanged)
    Q_PROPERTY(qint32 amountResourceTaken READ getAmountResourceTaken NOTIFY amountResourceTakenChanged)
    Q_PROPERTY(QString resourceProduced READ getResourceProduced NOTIFY resourceProducedChanged)
    Q_PROPERTY(qint32 amountResourceProduced READ getAmountResourceProduced NOTIFY amountResourceProducedChanged)
public:
    Building(QString name, qint32 level, QString description, QString icon,
                      QString color, QString resourcetobuild, qint32 amounttobuild, qreal multipliertobuild,
                      QString resourcetaken, qint32 amountresourcetaken, QString resourceproduced, qint32 amountresourceproduced);
    Building(QObject *parent = 0);
    Building(const Building &);
    Building & operator=(const Building &);

    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

    QString getName() const;

    qint32 getLevel() const;
    void setLevel(const qint32 &value);

    QString getDescription() const;

    QString getIcon() const;

    QString getColor() const;

    QString getResourceToBuild() const;

    qint32 getAmountToBuild() const;

    qreal getMultiplierToBuild() const;

    QString getResourceTaken() const;

    qint32 getAmountResourceTaken() const;

    QString getResourceProduced() const;

    qint32 getAmountResourceProduced() const;

signals:
    void levelChanged();
    void nameChanged();
    void descriptionChanged();
    void iconChanged();
    void colorChanged();
    void resourceToBuildChanged();
    void amountToBuildChanged();
    void multiplierToBuildChanged();
    void resourceTakenChanged();
    void amountResourceTakenChanged();
    void resourceProducedChanged();
    void amountResourceProducedChanged();
public slots:

private:
    QString name;
    qint32 level;
    QString description;
    QString icon;
    QString color;
    QString resourceToBuild;
    qint32 amountToBuild;
    qreal multiplierToBuild;

    QString resourceTaken;
    qint32 amountResourceTaken;
    QString resourceProduced;
    qint32 amountResourceProduced;




};

#endif // BUILDING_H
