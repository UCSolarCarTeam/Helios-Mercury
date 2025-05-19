#ifndef IPACKET_H
#define IPACKET_H

#include <QJsonObject>
#include <QByteArray>

class IPacket : public QObject {
public:
    virtual ~IPacket() {}

    /** Populate class vars given a QByteArray */
    virtual void populatePacket(const QByteArray& data) = 0;

    /**
     *  Populate class vars given CAN message id and data
     *  Searches idAction map to get setter action mapped to given id
     *  if found, populate required class vars
     *  if not found, print warning message and continue
     */
    virtual void populatePacket(const int id, const QByteArray& data) final {
        if(idActionMap.find(id) != idActionMap.end()){
            idActionMap[id](data); //execute action mapped to given id
        } else {
            qWarning() << "No actions registered for ID: " << id;
        }
    }

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

protected:
    /** Method for all child classes to map CAN messages IDs to the appropriate setters */
    virtual void initializeIdActionMap(){}; //TODO: switch from {} to = 0 once all child classes are updated

    /** Unordered mapping to define actions to populate data fields based on id */
    std::unordered_map<int, std::function<void(const QByteArray&)>> idActionMap;
};

#endif // IPACKET_H
