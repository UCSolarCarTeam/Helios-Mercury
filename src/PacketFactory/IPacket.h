#ifndef IPACKET_H
#define IPACKET_H

#include <QObject>
#include <QByteArray>
#include <QJsonObject>
#include <QDataStream>
#include <QHash>
#include <functional>
#include <type_traits>

class IPacket : public QObject {
    Q_OBJECT

public:
    explicit IPacket(QObject* parent = nullptr)
        : QObject(parent)
    {}

    virtual ~IPacket() = default;

    /**
     * Register a handler lambda for a given packet ID (e.g. CAN PGN).
     * The lambda should unpack `data` (up to 8 bytes) into your properties.
     */
    void registerHandler(quint32 id,
                         std::function<void(const QByteArray&)> h)
    {
        if (handlers_.contains(id)) {
            auto old = handlers_[id];
            handlers_[id] = [old, h](auto& data){
                old(data);
                h(data);
            };
        } else {
            handlers_[id] = std::move(h);
        }
    }

    virtual void populatePacket(const QByteArray& data) = 0;

    /**
     * Dispatch an incoming frame: look up its ID and invoke the
     * registered handler, or warn if none was registered.
     */
    void populatePacket(quint32 id, const QByteArray& data)
    {
        auto it = handlers_.find(id);
        if (it == handlers_.end()) {
            qWarning() << "IPacket: no handler for ID"
                       << QString::number(id, 16);
            return;
        }
        qDebug("yeesss");
        it.value()(data);
    }

    /** Convert all stored properties into a QJsonObject */
    virtual QJsonObject toJson() = 0;

    /** Extract a value of type T from data[startIndex…] (Little-Endian) */
    template <class T>
    T getValue(const QByteArray& data, int startIndex) const
    {
        if (startIndex < 0 || startIndex + int(sizeof(T)) > data.size()) {
            qWarning() << "IPacket::getValue: invalid index"
                       << startIndex << "for size" << data.size();
            return T(0);
        }
        QDataStream stream(data.mid(startIndex, sizeof(T)));
        stream.setByteOrder(QDataStream::LittleEndian);
        if constexpr (std::is_floating_point_v<T>) {
            stream.setFloatingPointPrecision(QDataStream::SinglePrecision);
        }
        return readStream<T>(stream);
    }

private:
    /** Helper to read a T from the QDataStream */
    template <class T>
    T readStream(QDataStream& stream) const
    {
        T value{};
        stream >> value;
        return value;
    }

    /** Map of packet-ID → unpacking handler */
    QHash<quint32, std::function<void(const QByteArray&)>> handlers_;
};

#endif // IPACKET_H
