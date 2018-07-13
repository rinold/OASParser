
import Foundation
import XTendedCodable

/// License information for the exposed API.
///
/// This object MAY be extended with Specification Extensions.
public struct OASLicense: XTendedCodable {

    /// **REQUIRED**. The license name used for the API.
    public let name: String

    /// A URL to the license used for the API.
    public let url: URL?

    /// Specification Extensions
    public var extensions: XTension?
    
}
