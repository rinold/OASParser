
import Foundation
import XTendedCodable

/// Allows referencing an external resource for extended documentation.
///
/// This object MAY be extended with Specification Extensions.
public struct OASExternalDocs: XTendedCodable {

    /// **REQUIRED**. The URL for the target documentation.
    let url: URL

    /// A short description of the target documentation. 
    /// Special (see discussions) syntax MAY be used for rich text representation.
    ///
    /// Special syntax that MAY be used are:
    /// - OpenAPI 3: CommonMark
    /// - OpenAPI 2: GFM
    let description: String?

    /// Specification Extensions
    public var extensions: XTension?

}
