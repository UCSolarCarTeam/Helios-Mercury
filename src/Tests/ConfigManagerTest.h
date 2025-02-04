#ifndef CONFIGMANAGERTEST_H
#define CONFIGMANAGERTEST_H

#include <QObject>

/*!
 * \brief The ConfigManagerTest class
 *        Declares the Qt Test slots for testing ConfigManager.
 */
class ConfigManagerTest : public QObject
{
    Q_OBJECT

private slots:
    void testNoConfigFile();
    void testPartialConfig();
};

/*!
 * \brief Runs all ConfigManager tests.
 *
 * \param argc The command-line argument count.
 * \param argv The command-line argument values.
 * \return The combined exit status of the test runs.
 */
int runConfigManagerTests(int argc, char** argv);

#endif // CONFIGMANAGERTEST_H
