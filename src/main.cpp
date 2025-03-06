// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QLockFile>
#include <QDir>
#include <QDebug>

#include "Mercury.h"
#include "Config/Logger.h"
#include "Config/ConfigManager.h"

#include "app_environment.h"
#include "import_qml_components_plugins.h"
#include "import_qml_plugins.h"

int main(int argc, char *argv[])
{
    ConfigManager& config = ConfigManager::instance();

    if(config.getLoggingEnabled()){
        Logger::installMessageHandler(config.getLogPath());
    }

    QString tmpDir = QDir::tempPath();
    QLockFile lockFile(tmpDir + "/heliosHermes.lock");

    if (!lockFile.tryLock(100))
    {
        qDebug() << "An instance of Hermes is already running";
        qDebug() << "If you are sure you only have one instance of Hermes running, please delete the file /tmp/heliosHermes.lock.";
        qDebug() << "Exiting - Get it right next time...";
        return 1;
    }
    else
    {
        qDebug() << "No other instance of Hermes exists.";
        qDebug() << "Launching Hermes...";
    }
    
    Mercury app(argc, argv);

    return app.exec();
}
