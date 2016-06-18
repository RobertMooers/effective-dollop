#include "item.h"

Item::Item(QString name, QString icon, QString color, QString description):mName(name), mIcon(icon), mColor(color), mDescription(description) {

}

Item::Item(QObject *parent) : QObject(parent)
{

}

Item::Item(const Item & other) {
    *this = other;
}

Item & Item::operator=(const Item & copy) {
    mName = copy.mName;
    mDescription = copy.mDescription;
    mIcon = copy.mIcon;
    mColor = copy.mColor;
    return *this;
}

QString Item::getName() {
    return mName;
}

QString Item::getIcon() {
    return mIcon;
}

QString Item::getColor() {
    return mColor;
}

QString Item::getDescription() {
    return mDescription;
}

void Item::read(const QJsonObject &json)
{
    mName = json["name"].toString();
    mDescription = json["description"].toString();
    mIcon = json["icon"].toString();
    mColor = json["color"].toString();
}

void Item::write(QJsonObject &json) const
{
    json["name"] = mName;
    json["description"] = mDescription;
    json["icon"] = mIcon;
    json["color"] = mColor;
}
