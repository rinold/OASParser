
/// The root document object of the OpenAPI document with only version field.
public struct OAS3DocumentVersion: Codable {

    /// **REQUIRED.**
    /// This string **MUST** be the semantic version number of the OpenAPI Specification version
    /// that the OpenAPI document uses.
    ///
    /// The openapi field *SHOULD* be used by tooling specifications and clients to interpret
    /// the OpenAPI document. This is not related to the API info.version string.
    public let version: OASVersion

    // Codable
    enum CodingKeys: String, CodingKey {
        case version = "openapi"
    }
}
