#ifndef CONFIGMANAGERTEST_H
#define CONFIGMANAGERTEST_H

#include <QObject>

// Class for Config Manager unit testing
class ConfigManagerTest : public QObject
{
    Q_OBJECT

private slots:
    void testNoConfigFile();
    void testPartialConfig();
};


int runConfigManagerTests(int argc, char** argv);

#endif // CONFIGMANAGERTEST_H
