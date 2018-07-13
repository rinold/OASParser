
import Foundation
import XTendedCodable

/// The object provides metadata about the API.
/// The metadata MAY be used by the clients if needed, and MAY be presented in
/// editing or documentation generation tools for convenience.
///
/// This object MAY be extended with Specification Extensions.
public struct OASInfo: XTendedCodable {

    /// **REQUIRED**. The title of the application.
    public let title: String

    /// A short description of the application.
    /// Special (see discussions) syntax MAY be used for rich text representation.
    ///
    /// Special syntax that MAY be used are:
    /// - OpenAPI 3: CommonMark
    /// - OpenAPI 2: GFM
    public let description: String?

    /// A URL to the Terms of Service for the API.
    public let termsOfService: URL?

    /// The contact information for the exposed API.
    public let contact: OASContact?

    /// The license information for the exposed API.
    public let license: OASLicense?

    /// **REQUIRED**.
    /// The version of the OpenAPI document (which is distinct from the
    /// OpenAPI Specification version or the API implementation version).
    public let version: OASVersion

    /// Specification Extensions
    public var extensions: XTension?
    
}
