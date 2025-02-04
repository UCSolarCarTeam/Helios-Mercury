#include "TestManager.h"
#include "ConfigManagerTest.h"

//  Manager class for instantiating and running all Mercury unit tests
TestManager::TestManager(int argc, char** argv) {
    int testRes = runConfigManagerTests(argc, argv);

}
