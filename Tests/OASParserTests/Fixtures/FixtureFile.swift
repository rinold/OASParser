
import Foundation

protocol SwiftFixture {
    var contents: String { get }
}

class FixtureFile {
    static var fixturePath = "./Tests/OASParserTests/Fixtures/"
    static var swiftFixtures: [String: SwiftFixture] = ["v3/petstore-expanded": PetstoreExpandedFixture()]

    let name: String
    let type: String

    init(name: String, type: String = "json") {
        self.name = name
        self.type = type
    }

    var path: String {
        let filename: String = type.isEmpty ? name : "\(name).\(type)"
        return "\(FixtureFile.fixturePath)/\(filename)"
    }

    func data() throws -> Data {
        if let contents = FixtureFile.swiftFixtures[name]?.contents, let data = contents.data(using: .utf8) {
            return data
        }
        return try Data(contentsOf: URL(fileURLWithPath: path))
    }
}
