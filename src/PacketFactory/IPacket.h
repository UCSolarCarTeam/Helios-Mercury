#ifndef IPACKET_H
#define IPACKET_H

#include <QJsonObject>
#include <QByteArray>

class IPacket {
public:
    virtual ~IPacket() {}

    /** Populate class vars given a QByteArray */
    virtual void populatePacket(const QByteArray& data) = 0;

    /** returns Json object of all class data */
    virtual QJsonObject toJson() = 0;

    /** Extracts value of type T from QByteArray at startIndex */
    template <class T>
    T getValue(const QByteArray& data, int startIndex) {
        if(startIndex < 0 || startIndex + sizeof(T) > data.size()) {
            qWarning() << "Invalid start index for packet data";
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
    /** Reads value of type T from QDataStream */
    template <class T>
    T readStream(QDataStream& stream) {
        T value;
        stream >> value;
        return value;
    }
};

#endif // IPACKET_H
