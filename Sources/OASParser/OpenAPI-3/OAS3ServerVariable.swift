
public struct OAS3ServerVariable: Codable {
    
    /// The default value to use for substitution, and to send, if an alternate value is not supplied.
    public let defaults: String
    
    /// An enumeration of string values to be used if the substitution options are from a limited set.
    public let enumeration: [String]?
    
    /// An optional description for the server variable.
    public let description: String?
    
    // Codable
    enum CodingKeys: String, CodingKey {
        case defaults = "default"
        case enumeration = "enum"
        case description
    }
}
