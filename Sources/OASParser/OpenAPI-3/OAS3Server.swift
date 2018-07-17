
import XTendedCodable

/// An object representing a Server.
///
/// This object MAY be extended with Specification Extensions.
public struct OAS3Server: XTendedCodable {

    /// **REQUIRED**.
    /// A URL to the target host.
    ///
    /// This URL supports Server Variables and MAY be relative,
    /// to indicate that the host location is relative to the location
    /// where the OpenAPI document is being served.
    ///
    /// Variable substitutions will be made when a variable is named in {brackets}
    public let url: String
    
    /// An optional string describing the host designated by the URL.
    public let description: String?
    
    /// A map between a variable name and its value.
    ///
    /// The value is used for substitution in the server's URL template.
    public let variables: [String: OAS3ServerVariable]?

    /// Specification Extensions
    public var extensions: XTension?
    
}
