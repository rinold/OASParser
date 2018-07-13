
import XTendedCodable

/// Allows adding meta data to a single tag that is used by the Operation.
/// It is not mandatory to have a Tag per tag used there.
///
/// This object MAY be extended with Specification Extensions.
public struct OASTag: XTendedCodable {

    /// **REQUIRED**. The name of the tag.
    let name: String

    /// A short description for the tag. 
    /// Special (see discussions) syntax MAY be used for rich text representation.
    ///
    /// Special syntax that MAY be used are:
    /// - OpenAPI 3: CommonMark
    /// - OpenAPI 2: GFM
    let description: String?

    /// Additional external documentation for this tag.
    let externalDocumentation: OASExternalDocs?

    /// Specification Extensions
    public var extensions: XTension?

}
