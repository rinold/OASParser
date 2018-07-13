
/// The root document object of the OpenAPI document.
public struct OAS3Document: Codable {

    /// **REQUIRED**.
    /// This string **MUST** be the semantic version number of the OpenAPI Specification version
    /// that the OpenAPI document uses.
    ///
    /// The openapi field *SHOULD* be used by tooling specifications and clients to interpret
    /// the OpenAPI document. This is not related to the API info.version string.
    public let version: OASVersion

    /// **REQUIRED**.
    /// Provides metadata about the API. The metadata MAY be used by tooling as required.
    public let info: OASInfo

    /// An array of Server Objects, which provide connectivity information to a target server.
    /// If the servers property is not provided, or is an empty array, the default value would be a Server Object with a url value of /.
    public let servers: [OAS3Server]?

    /// The available paths and operations for the API.
//    public let paths: [String: OASPath]

    /// An element to hold various schemas for the specification.
//    public let components: OASComponents?

    /// A declaration of which security schemes are applied for the API as a whole.
    /// The list of values describes alternative security schemes that can be used
    /// (that is, there is a logical OR between the security requirements).
    /// Individual operations can override this definition.
//    public let securityRequirements: [OASSecurityRequirement]

    /// A list of tags used by the specification with additional metadata.
    /// The order of the tags can be used to reflect on their order by the parsing tools.
    /// Not all tags that are used by the Operation must be declared.
    /// The tags that are not declared may be organized randomly or based on the tools' logic.
    /// Each tag name in the list MUST be unique.
    public let tags: [OASTag]?

    /// Additional external documentation.
    public let externalDocumentation: OASExternalDocs?

    // Codable
    private enum CodingKeys: String, CodingKey {
        case version = "openapi"
        case info
        case servers
        case tags
        case externalDocumentation = "externalDocs"
    }
}
