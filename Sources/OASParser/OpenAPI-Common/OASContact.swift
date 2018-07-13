
import Foundation
import XTendedCodable

/// Contact information for the exposed API.
///
/// This object MAY be extended with Specification Extensions.
public struct OASContact: XTendedCodable {

    /// The identifying name of the contact person/organization.
    public let name: String?

    /// The URL pointing to the contact information.
    public let url: URL?

    /// The email address of the contact person/organization.
    /// MUST be in the format of an email address.
    public let email: String? // TODO: make Email struct? (for auto validation of this field?)

    /// Specification Extensions
    public var extensions: XTension?

}
