#include "game.h"


Game::Game(QObject *parent) : QObject(parent)
{

}

bool Game::addItem(const QString &name, int amount){
    bool returnable(false);
    qint32 found(-1);
    for (int i(0); i < mInvItems.count(); i++){
        if (!(((mInvItems[i]).getName()).compare(name)))
            found = i;
    }
    if (found != -1){
        if (amount > 0){
            mInvItems[found].setAmount(mInvItems[found].getAmount() + amount);
            returnable = true;
        }
        else if (mInvItems[found].getAmount() + amount >= 0){
            mInvItems[found].setAmount(mInvItems[found].getAmount() + amount);
            returnable = true;
        }
    }
    else if (amount > 0){
        InvItem invItem;
        invItem.setAmount(amount);
        for (int i(0); i < mItems.count(); i++){
            if (!mItems[i].getName().compare(name))
                invItem.setItem(mItems[i]);
        }
        mInvItems.append(invItem);
        returnable = true;
    }
    invItemsChanged();
    return returnable;
}

qreal Game::getMusicVolume()
{
    return mMusicVolume;
}

void Game::setMusicVolume(qreal volume)
{
    mMusicVolume = volume;
}

bool Game::getMusicMute()
{
    return mMusicMute;
}

void Game::setMusicMute(bool mute)
{
    mMusicMute = mute;
}

bool Game::getIntroText()
{
    return mIntroText;
}

void Game::setIntroText(bool intro)
{
    mIntroText = intro;
}

bool Game::loadGame() {
    QFile loadFile(QStringLiteral("../save.json"));

    if (!loadFile.open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open save file.");
        return false;
    }

    QByteArray saveData = loadFile.readAll();

    QJsonDocument loadDoc(QJsonDocument::fromJson(saveData));

    read(loadDoc.object());

    return true;
}

bool Game::saveGame(){
    QFile saveFile(QStringLiteral("../save.json"));

    if (!saveFile.open(QIODevice::WriteOnly)) {
        qWarning("Couldn't open save file.");
        return false;
    }

    QJsonObject gameObject;
    write(gameObject);
    QJsonDocument saveDoc(gameObject);
    saveFile.write(saveDoc.toJson());

    return true;
}

void Game::read(const QJsonObject &json) {
    mMusicVolume = json["musicVolume"].toDouble();
    mMusicMute = json["musicMute"].toBool();
    mIntroText = json["introText"].toBool();

    mBuildings.clear();
    QJsonArray buildingArray = json["buildings"].toArray();
    for (int buildingIndex(0); buildingIndex < buildingArray.size(); ++buildingIndex) {
        QJsonObject buildingObject = buildingArray[buildingIndex].toObject();
        Building building;
        building.read(buildingObject);
        mBuildings.append(building);
    }

    mItems.clear();
    QJsonArray itemArray = json["items"].toArray();
    for (int itemIndex(0); itemIndex < itemArray.size(); ++itemIndex) {
        QJsonObject itemObject = itemArray[itemIndex].toObject();
        Item item;
        item.read(itemObject);
        mItems.append(item);
    }



    mInvItems.clear();
    QJsonArray invItemArray = json["invItems"].toArray();
    for (int invItemIndex(0); invItemIndex < invItemArray.size(); ++invItemIndex) {
        QJsonObject invItemObject = invItemArray[invItemIndex].toObject();
        InvItem invItem;
        invItem.read(invItemObject);
        for (int i(0); i < mItems.count(); i++){
            if (!mItems[i].getName().compare(invItem.getName()))
                invItem.setItem(mItems[i]);
        }
        mInvItems.append(invItem);
    }

}

void Game::write(QJsonObject &json) const {
    json["musicVolume"] = mMusicVolume;
    json["musicMute"] = mMusicMute;
    json["introText"] = mIntroText;

    QJsonArray buildingArray;
    Building building;
    foreach (building, mBuildings) {
        QJsonObject buildingObject;
        building.write(buildingObject);
        buildingArray.append(buildingObject);
    }
    json["buildings"] = buildingArray;

    QJsonArray invItemArray;
    InvItem invItem;
    foreach (invItem, mInvItems) {
        QJsonObject invItemObject;
        invItem.write(invItemObject);
        invItemArray.append(invItemObject);
    }
    json["invItems"] = invItemArray;

    QJsonArray itemArray;
    Item item;
    foreach (item, mItems) {
        QJsonObject itemObject;
        item.write(itemObject);
        itemArray.append(itemObject);
    }
    json["items"] = itemArray;
}
