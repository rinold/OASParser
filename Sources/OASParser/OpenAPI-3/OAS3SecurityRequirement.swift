
/// Lists the required security schemes to execute this operation.
/// The name used for each property MUST correspond to a security scheme
/// declared in the Security Schemes under the Components Object.
///
/// Security Requirement Objects that contain multiple schemes require that all
/// schemes MUST be satisfied for a request to be authorized. This enables support
/// for scenarios where multiple query parameters or HTTP headers are required to
/// convey security information.
///
/// When a list of Security Requirement Objects is defined on the Open API object
/// or Operation Object, only one of Security Requirement Objects in the list needs
/// to be satisfied to authorize the request.
///
/// *Patterned Fields*
///
/// Field Pattern    Type    Description
/// {name}    [string]    Each name MUST correspond to a security scheme which is declared in the Security Schemes under the Components Object. If the security scheme is of type "oauth2" or "openIdConnect", then the value is a list of scope names required for the execution. For other security scheme types, the array MUST be empty.

public typealias OAS3SecurityRequirement = [String: [String]]

//public enum SecuritySchema {
//    case basic(description: String?)
//    case apiKey(description: String?, schema: APIKeySchema)
//    case oauth2(description: String?, schema: OAuth2Flows)
//    case openId(description: String?, url: URL)
//}

//enum SecuritySchemaBuilder: Codable {
//    case basic(description: String?)
//    case apiKey(description: String?, schema: APIKeySchemaBuilder)
//    case oauth2(description: String?, schema: OAuth2FlowsBuilder)
//    case openId(description: String?, url: URL)
//
//    enum CodingKeys: String, CodingKey {
//        case type
//        case description
//        case flows
//        case openIdConnectUrl
//    }
//
//    init(from decoder: Decoder) throws {
//        enum SecurityType: String, Codable {
//            case basic = "http"
//            case apiKey
//            case oauth2
//            case openIdConnect
//        }
//
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        let type = try values.decode(SecurityType.self, forKey: .type)
//        let description = try values.decodeIfPresent(String.self, forKey: .description)
//        switch type {
//        case .basic:
//            self = .basic(description: description)
//        case .apiKey:
//            self = .apiKey(description: description, schema: try APIKeySchemaBuilder(from: decoder))
//        case .oauth2:
//            let flows = try values.decode(OAuth2FlowsBuilder.self, forKey: .flows)
//            self = .oauth2(description: description, schema: flows)
//        case .openIdConnect:
//            let url = try values.decode(URL.self, forKey: .openIdConnectUrl)
//            self = .openId(description: description, url: url)
//        }
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var values = encoder.container(keyedBy: CodingKeys.self)
//        let description: String?
//        switch self {
//        case .basic(let basicDescription):
//            description = basicDescription
//        case .apiKey(let apiKeyDescription, let schema):
//            description = apiKeyDescription
//            try schema.encode(to: encoder)
//        case .oauth2(let oauth2Description, let schema):
//            description = oauth2Description
//            try schema.encode(to: encoder)
//        case .openId(let openIdDescription, let url):
//            description = openIdDescription
//            try url.encode(to: encoder)
//        }
//
//        if let description = description {
//            try values.encode(description, forKey: .description)
//        }
//    }
//}
//
//extension SecuritySchemaBuilder: Builder {
//    typealias Building = SecuritySchema
//
//    func build(_ swagger: SwaggerBuilder) throws -> SecuritySchema {
//        switch self {
//        case .basic(let description):
//            return .basic(description: description)
//        case .apiKey(let description, let builder):
//            return .apiKey(description: description, schema: try builder.build(swagger))
//        case .oauth2(let description, let builder):
//            return .oauth2(description: description, schema: try builder.build(swagger))
//        case .openId(let description, let url):
//            return .openId(description: description, url: url)
//        }
//    }
//}
//
//extension SecuritySchemaBuilder {
//    static func resolve(_ swagger: SwaggerBuilder, reference: Reference<SecuritySchemaBuilder>) throws
//        -> Either<SecuritySchema, Structure<SecuritySchema>>
//    {
//        switch reference {
//        case .pointer(let pointer):
//            return .b(try self.resolver.resolve(swagger, pointer: pointer))
//        case .value(let builder):
//            return .a(try builder.build(swagger))
//        }
//    }
//}

