#include "invitem.h"

InvItem::InvItem(QObject *parent) : QObject(parent), mAmount(0)
{

}

InvItem::InvItem(QString name, qint32 amount) :mName(name), mAmount(amount)
{

}

InvItem::InvItem(const InvItem & other) {
    *this = other;
}

InvItem & InvItem::operator=(const InvItem & copy) {
    mIcon = copy.mIcon;
    mDescription = copy.mDescription;
    mColor = copy.mColor;
    mAmount = copy.mAmount;
    mName = copy.mName;
    return *this;
}

void InvItem::setItem(Item item) {
    mName = item.getName();
    mIcon = item.getIcon();
    mDescription = item.getDescription();
    mColor = item.getColor();
    iconChanged();
    colorChanged();
    descriptionChanged();
}

QString InvItem::getName() {
    return mName;
}

void InvItem::setName(QString name) {
    mName = name;
    nameChanged();
}

QString InvItem::getIcon() {
    return mIcon;
}

QString InvItem::getColor() {
    return mColor;
}

QString InvItem::getDescription() {
    return mDescription;
}

int InvItem::getAmount() {
    return mAmount;
}

void InvItem::setAmount(int amount) {
    mAmount = amount;
    amountChanged();
}

void InvItem::read(const QJsonObject &json)
{
    mName = json["name"].toString();
    mAmount = json["amount"].toInt();
}

void InvItem::write(QJsonObject &json) const
{
    json["name"] = mName;
    json["amount"] = mAmount;
}
