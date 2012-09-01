#ifndef SHORTCUT_H
#define SHORTCUT_H

#include <QWidget>
#include <QMap>
class QShortcut;

class Shortcut : public QObject
{
    Q_OBJECT

public:
    /**
      *constructor
      */
    Shortcut(QWidget *parent = 0);

    /**
      *sets the \a shortcut and the \a member corresponding to the action
      *if recognize the \a id, @return true if succes, otherwise return false
      *\see getPosibleIds()
      *@param id the sginal identification
      *@param shortcut the shortcur
      */
    bool addShortcut(QString id, QString shortcut, std::string member);

    /**
      * @return true if the shortcut own by \a id is empty, otherwise
      * @return false
      */
    bool isEmpty(QString id);

    /**  \brief return the list with the posible \a id you can use\n
      *
      * _open: open()\n
      * _openDir: openDir()\n
      * _save: save()\n
      * _print: print()\n
      * _fileProperties: fileProperties()\n
      * _exit: exit()\n
      * _showMenuBar: showMenuBar()\n
      * _toolBarMovable: setToolBarMovable()\n
      * _configure: configureProgram()\n
      * _zoomIn: zoomIn()\n
      * _zoomOut: zoomOut()\n
      * _normalSize: normalSize()\n
      * _bestFit: adjustSize()\n
      * _toLeft: rotateLeft()\n
      * _toRight: rotateRight()\n
      * _horizontally: flipHorizontally()\n
      * _vertically: flipVertically()\n
      * _next: next()\n
      * _previous: previous()\n
      * _last: goLast()\n
      * _first: goFirst()\n
      * _about: about()\n
      * _aboutQt: aboutQt()\n
      * \see addShortcut(QString, QShortcut*, std::string member)
      */
    QStringList getPosibleIds() const {
        return avaibleIds;
    }

    /**
      * @returns the signal corresponding to the id
      */
    std::string getSignal(QString id);

    /**
      * @returns the member corresponding to the id
      */
    std::string getMember(QString id);

    /**
      *connects the shortcuts according to the \a ids
      */
    void MakeConnections(QStringList ids);

    /**
      *disconnect every shortcut
      */
    void disconnectShortcuts();

signals:
    void open();
    void openDir();
    void save();
    void print();
    void fileProperties();
    void exit();
    void showMenuBar();
    void setToolBarMovable();
    void configureProgram();
    void zoomIn();
    void zoomOut();
    void normalSize();
    void adjustSize();
    void rotateLeft();
    void rotateRight();
    void flipHorizontally();
    void flipVertically();
    void next();
    void previous();
    void goFirst();
    void goLast();
    void about();
    void aboutQt();

public slots:

private:
    struct Action {
        QShortcut *shortcut;
        std::string signal;
        std::string member;
    };

    QMap<QString, Action> shortcuts;
    QStringList avaibleIds;
    QStringList avaibleSignals;

private slots:

};

#endif // SHORTCUT_H
