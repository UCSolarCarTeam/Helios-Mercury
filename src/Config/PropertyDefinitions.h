#ifndef PROPERTYDEFINITIONS_H
#define PROPERTYDEFINITIONS_H

#include <QObject>

/**
 *  Defines Packet Attribute Properties for linking to qml
 *  Creates Q_PROPERY with getter, setter, and signal, as well as the
 *  private class var (type name_)
 *
 *  Defines:
 *  public getter getName()
 *  public setter setName(type)
 *  private var Name_
 *
 *  Note that name should be capilized in current state to follow
 *  best naming conventions
*/
#define DEFINE_PROPERTY(type, name)                                           \
private:                                                                      \
    type name##_;                                                             \
                                                                              \
    public:                                                                       \
    Q_PROPERTY(type name READ get##name WRITE set##name NOTIFY name##Changed)      \
    type get##name() const { return name##_; }                                     \
    void set##name(type value) {                                              \
        if (name##_ != value) {                                               \
            name##_ = value;                                                  \
            emit name##Changed();                                             \
    }                                                                     \
}                                                                         \
                                                                              \
    Q_SIGNALS:                                                                      \
    void name##Changed();

#endif // PROPERTYDEFINITIONS_H
