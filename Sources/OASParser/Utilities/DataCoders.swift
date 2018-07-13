
import Foundation

public protocol DataDecoder: class {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

public protocol DataEncoder: class {
    func encode<T>(_ object: T) throws -> Data where T: Encodable
}

extension JSONDecoder: DataDecoder { }
