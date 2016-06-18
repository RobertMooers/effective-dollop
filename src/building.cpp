#include "building.h"

Building::Building(QString name, qint32 level, QString description, QString icon, QString color,
                   QString resourcetobuild, qint32 amounttobuild, qreal multipliertobuild, QString resourcetaken,
                   qint32 amountresourcetaken, QString resourceproduced, qint32 amountresourceproduced): name(name),
    level(level), description(description), icon(icon), color(color), resourceToBuild(resourcetobuild),
    amountToBuild(amounttobuild), multiplierToBuild(multipliertobuild), resourceTaken(resourcetaken), amountResourceTaken(amountresourcetaken),
    resourceProduced(resourceproduced), amountResourceProduced(amountresourceproduced)
{

}

Building::Building(QObject *parent) : QObject(parent)
{

}

Building::Building(const Building & other) {
    *this = other;
}

Building & Building::operator=(const Building & copy) {
    name = copy.name;
    level = copy.level;
    description = copy.description;
    icon = copy.icon;
    color = copy.color;
    resourceToBuild = copy.resourceToBuild;
    amountToBuild = copy.amountToBuild;
    multiplierToBuild = copy.multiplierToBuild;
    resourceTaken = copy.resourceTaken;
    amountResourceTaken = copy.amountResourceTaken;
    resourceProduced = copy.resourceProduced;
    amountResourceProduced = copy.amountResourceProduced;
    return *this;
}

void Building::read(const QJsonObject &json) {
    name = json["name"].toString();
    level = json["level"].toInt();
    description = json["description"].toString();
    icon = json["icon"].toString();
    color = json["color"].toString();
    resourceToBuild = json["resourceToBuild"].toString();
    amountToBuild = json["amountToBuild"].toInt();
    multiplierToBuild = json["multiplierToBuild"].toDouble();
    resourceTaken = json["resourceTaken"].toString();
    amountResourceTaken = json["amountResourceTaken"].toInt();
    resourceProduced = json["resourceProduced"].toString();
    amountResourceProduced = json["amountResourceProduced"].toInt();
}

void Building::write(QJsonObject &json) const {
    json["name"] = name;
    json["level"] = level;
    json["description"] = description;
    json["icon"] = icon;
    json["color"] = color;
    json["resourceToBuild"] = resourceToBuild;
    json["amountToBuild"] = amountToBuild;
    json["multiplierToBuild"] = multiplierToBuild;
    json["resourceTaken"] = resourceTaken;
    json["amountResourceTaken"] = amountResourceTaken;
    json["resourceProduced"] = resourceProduced;
    json["amountResourceProduced"] = amountResourceProduced;
}

QString Building::getName() const
{
    return name;
}

qint32 Building::getLevel() const
{
    return level;
}

void Building::setLevel(const qint32 &value)
{
    level = value;
    levelChanged();
}

QString Building::getDescription() const
{
    return description;
}


QString Building::getIcon() const
{
    return icon;
}


QString Building::getColor() const
{
    return color;
}

QString Building::getResourceToBuild() const
{
    return resourceToBuild;
}

qint32 Building::getAmountToBuild() const
{
    return amountToBuild;
}

qreal Building::getMultiplierToBuild() const
{
    return multiplierToBuild;
}

QString Building::getResourceTaken() const
{
    return resourceTaken;
}

qint32 Building::getAmountResourceTaken() const
{
    return amountResourceTaken;
}

QString Building::getResourceProduced() const
{
    return resourceProduced;
}

qint32 Building::getAmountResourceProduced() const
{
    return amountResourceProduced;
}

