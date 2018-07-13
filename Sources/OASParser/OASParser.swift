import Foundation

public struct OASParser {
    static func parse(data: Data, using decoder: DataDecoder) throws -> OAS3Document {
        return try decoder.decode(OAS3Document.self, from: data)
    }
}

public enum OpenAPI {
    case v2
    case v3
}
