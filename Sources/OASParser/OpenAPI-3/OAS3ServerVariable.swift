
import XTendedCodable

/// An object representing a Server Variable for server URL template substitution.
///
/// This object MAY be extended with Specification Extensions.
public struct OAS3ServerVariable: XTendedCodable {

    /// **REQUIRED**.
    /// The default value to use for substitution, and to send, if an alternate value is not supplied.
    public let defaultValue: String
    
    /// An enumeration of string values to be used if the substitution options are from a limited set.
    public let enumeration: [String]?
    
    /// An optional description for the server variable.
    public let description: String?

    /// Specification Extensions
    public var extensions: XTension?

}

extension OAS3ServerVariable {
    enum CodingKeys: String, CodingKey {
        case defaultValue = "default"
        case enumeration = "enum"
        case description
    }
}
