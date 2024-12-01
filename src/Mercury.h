#ifndef MERCURY_H
#define MERCURY_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>

class Mercury : public QGuiApplication {
    Q_OBJECT
public:
    Mercury(int &argc, char **argv);

private:
    QQmlApplicationEngine engine_;
};

#endif // MERCURY_H
