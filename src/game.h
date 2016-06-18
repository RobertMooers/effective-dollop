#ifndef GAME_H
#define GAME_H

#include <QObject>
#include <QJsonObject>
#include <QList>
#include <QQmlListProperty>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <stdio.h>

#include "building.h"
#include "item.h"
#include "invitem.h"

class Game : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Building> buildings READ getBuildings NOTIFY buildingsChanged)
    Q_PROPERTY(QQmlListProperty<Item> items READ getItems NOTIFY itemsChanged)
    Q_PROPERTY(QQmlListProperty<InvItem> invItems READ getInvItems NOTIFY invItemsChanged)
    Q_PROPERTY(qreal musicVolume READ getMusicVolume WRITE setMusicVolume NOTIFY musicVolumeChanged)
    Q_PROPERTY(bool musicMute READ getMusicMute WRITE setMusicMute NOTIFY musicMuteChanged)
    Q_PROPERTY(bool introText READ getIntroText WRITE setIntroText NOTIFY introTextChanged)
public:
    Game(QObject *parent = 0);

    QQmlListProperty<Building> getBuildings() {
        return QQmlListProperty<Building>(this, 0, &append_building, &count_building, &at_building, &clear_building);
    }

    QQmlListProperty<Item> Game::getItems() {
        return QQmlListProperty<Item>(this, 0, &append_item, &count_item, &at_item, &clear_item);
    }

    QQmlListProperty<InvItem> Game::getInvItems() {
        return QQmlListProperty<InvItem>(this, 0, &append_invItem, &count_invItem, &at_invItem, &clear_invItem);
    }

    Q_INVOKABLE bool addItem(const QString &msg, int amount);

    qreal getMusicVolume();
    void setMusicVolume(qreal volume);

    bool getMusicMute();
    void setMusicMute(bool mute);

    bool getIntroText();
    void setIntroText(bool intro);

    bool loadGame();
    bool saveGame();

    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

signals:
    void buildingsChanged();
    void itemsChanged();
    void invItemsChanged();
    void musicVolumeChanged();
    void musicMuteChanged();
    void introTextChanged();
public slots:

private:
    static void append_building(QQmlListProperty<Building> *list, Building *bld){
        Game *game = qobject_cast<Game *>(list->object);
        if (game && bld) {
            game->mBuildings.append(*bld);
            emit game->buildingsChanged();
        }
    }
    static int count_building(QQmlListProperty<Building>*list) {
        Game *game = qobject_cast<Game *>(list->object);
        if (game)
            return game->mBuildings.count();
        return 0;
    }
    static Building* at_building(QQmlListProperty<Building> *list, int i) {
        Game *game = qobject_cast<Game *>(list->object);
        if (game)
            return &(game->mBuildings[i]);
        return 0;
    }
    static void clear_building(QQmlListProperty<Building> *list) {
        Game *game = qobject_cast<Game *>(list->object);
            if (game) {
                game->mBuildings.clear();
                emit game->buildingsChanged();
            }
    }

    static void append_item(QQmlListProperty<Item> *list, Item *bld){
        Game *game = qobject_cast<Game *>(list->object);
        if (game && bld) {
            game->mItems.append(*bld);
            emit game->itemsChanged();
        }
    }
    static int count_item(QQmlListProperty<Item>*list) {
        Game *game = qobject_cast<Game *>(list->object);
        if (game)
            return game->mItems.count();
        return 0;
    }
    static Item* at_item(QQmlListProperty<Item> *list, int i) {
        Game *game = qobject_cast<Game *>(list->object);
        if (game)
            return &(game->mItems[i]);
        return 0;
    }
    static void clear_item(QQmlListProperty<Item> *list) {
        Game *game = qobject_cast<Game *>(list->object);
            if (game) {
                game->mItems.clear();
                emit game->itemsChanged();
            }
    }

    static void append_invItem(QQmlListProperty<InvItem> *list, InvItem *bld){
        Game *game = qobject_cast<Game *>(list->object);
        if (game && bld) {
            game->mInvItems.append(*bld);
            emit game->invItemsChanged();
        }
    }
    static int count_invItem(QQmlListProperty<InvItem>*list) {
        Game *game = qobject_cast<Game *>(list->object);
        if (game)
            return game->mInvItems.count();
        return 0;
    }

    static InvItem* at_invItem(QQmlListProperty<InvItem> *list, int i) {
        Game *game = qobject_cast<Game *>(list->object);
        if (game)
            return &(game->mInvItems[i]);
        return 0;
    }

    static void clear_invItem(QQmlListProperty<InvItem> *list) {
        Game *game = qobject_cast<Game *>(list->object);
            if (game) {
                game->mInvItems.clear();
                emit game->invItemsChanged();
            }
    }

    QList<Building> mBuildings;
    QList<InvItem> mInvItems;
    QList<Item> mItems;

    qreal mMusicVolume;
    bool mMusicMute;
    bool mIntroText;

};




#endif // GAME_H
