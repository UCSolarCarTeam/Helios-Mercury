#include "Logger.h"

QFile Logger::logFile("Mercury.log");
QMutex Logger::mutex;

void Logger::installMessageHandler() {
    qInstallMessageHandler(customMessageHandler);
}

void Logger::customMessageHandler(QtMsgType type, const QMessageLogContext &context, const QString &msg) {
    QMutexLocker locker(&mutex);

    QString logMessage;
    switch (type) {
        case QtDebugMsg:
            logMessage = QString("Debug: %1").arg(msg);
            break;
        case QtInfoMsg:
            logMessage = QString("Info: %1").arg(msg);
            break;
        case QtWarningMsg:
            logMessage = QString("Warning: %1").arg(msg);
            break;
        case QtCriticalMsg:
            logMessage = QString("Critical: %1").arg(msg);
            break;
        case QtFatalMsg:
            logMessage = QString("Fatal: %1").arg(msg);
            break;
    }

    fprintf(stderr, "%s\n", logMessage.toUtf8().constData());
    fflush(stderr);

    if(logFile.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text)) {
        QTextStream out(&logFile);
        out << QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss.zzz ");
        out << logMessage << Qt::endl;
        logFile.close();
    }
}
