#ifndef LOGGER_H
#define LOGGER_H

#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QMutex>
#include <QMutexLocker>
#include <QDebug>

class Logger {
public:
    static void installMessageHandler();
    static void customMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString &msg);

private:
    static QFile logFile;
    static QMutex mutex;
};

#endif
