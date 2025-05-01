#ifndef PROPERTYDEFINITIONS_H
#define PROPERTYDEFINITIONS_H

#include <QObject>

/**
 *  Defines Packet Attribute Properties for linking to qml
 *  Creates Q_PROPERY with getter, setter, and signal, as well as the
 *  private class var (type name_)
 *
 *  Defines:
 *  public getter Name()
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
    Q_PROPERTY(type name READ name WRITE set##name NOTIFY name##Changed)      \
    type name() const { return name##_; }                                     \
    void set##name(type value) {                                              \
        if (name##_ != value) {                                               \
            name##_ = value;                                                  \
            emit name##Changed();                                             \
    }                                                                     \
}                                                                         \
                                                                              \
    Q_SIGNALS:                                                                      \
    void name##Changed();                                                           \

#define DEFINE_HANDLER(canId, type, name, offset)                                 \
registerHandler((canId), [this](const QByteArray& data) {                          \
        auto v = this->getValue<type>(data, offset);              \
        qDebug() << "handler for" << QString::number(canId,16)    \
<< "invoked, raw data =" << data.toHex() << "value changed is type" << v;                  \
        this->set##name(v);                                         \
    }                                                                          \
);

#endif // PROPERTYDEFINITIONS_H
