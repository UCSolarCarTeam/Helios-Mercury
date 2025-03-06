#include "Logger.h"

QFile Logger::logFile;
QMutex Logger::mutex;

/** Initialize Logger, takes in log file and will write logs to the given path */
void Logger::installMessageHandler(const QString &logFile) {
    Logger::logFile.setFileName(logFile);
    qInstallMessageHandler(customMessageHandler);
}

/** 
 * Handles logging Qt messages
 * Handles messages of types: Debug, Info, Warning, Critical, and Fatal
 * Writes log messages to the log file
 */
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
