
import XCTest
@testable import OASParser

final class OASParserTests: XCTestCase {

    func testVersionDecoding() {
        do {
            let data = try FixtureFile(name: "v3/petstore-expanded").data()
            let decoder = JSONDecoder()
            let version = try decoder.decode(OAS3Document.self, from: data).version
            let expectedVersion = try OASVersion("3.0.1")

            XCTAssert(version == expectedVersion)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }

    func testInfoDecoding() {
        do {
            let data = try FixtureFile(name: "v3/petstore-expanded").data()
            let decoder = JSONDecoder()
            let document = try decoder.decode(OAS3Document.self, from: data)
            let info = document.info
            let expectedVersion = try OASVersion("1.2.1")

            let encoder = JSONEncoder()
            encoder.outputFormatting.insert(.prettyPrinted)
            let d = try encoder.encode(document)
            if let s = String(data: d, encoding: .utf8) {
                print (s)
            }

            guard let ext = info.extensions, let str = ext["x-ext-test"]?.to(String.self) else {
                XCTFail()
                return
            }
            XCTAssert(str == "Hello!")

            XCTAssert(info.title == "Swagger Petstore")
            XCTAssert(info.description == "A sample API that uses a petstore as an example to demonstrate features in the OpenAPI 3.0 specification")
            XCTAssert(info.termsOfService?.absoluteString == "http://swagger.io/terms/")
            XCTAssert(info.version == expectedVersion)

            XCTAssert(info.contact?.name == "Swagger API Team")
            XCTAssert(info.contact?.url?.absoluteString == "http://swagger.io")
            XCTAssert(info.contact?.email == "apiteam@swagger.io")

            XCTAssert(info.license?.name == "Apache 2.0")
            XCTAssert(info.license?.url?.absoluteString == "https://www.apache.org/licenses/LICENSE-2.0.html")
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }

    func testServerDecoding() {
        do {
            let data = try FixtureFile(name: "v3/petstore-expanded").data()
            let decoder = JSONDecoder()
            let servers = try decoder.decode(OAS3Document.self, from: data).servers

            XCTAssert(servers?.count == 2)
            guard let server1 = servers?.first, let server2 = servers?.last else {
                XCTAssert(false)
                return
            }
            XCTAssert(server1.url == "https://development.gigantic-server.com/v1")
            XCTAssert(server1.description == "Development server")
            XCTAssert(server1.variables == nil)

            XCTAssert(server2.url == "https://{username}.gigantic-server.com:{port}/{basePath}")
            XCTAssert(server2.description == "The production API server")

            XCTAssert(server2.variables?.count == 3)
            let username = server2.variables?["username"]
            let port = server2.variables?["port"]
            let basePath = server2.variables?["basePath"]
            XCTAssert(username?.defaultValue == "demo")
            XCTAssert(username?.description == "this value is assigned by the service provider, in this example `gigantic-server.com`")
            XCTAssertNil(username?.enumeration)

            XCTAssert(port?.defaultValue == "8443")
            XCTAssertNil(basePath?.description)
            XCTAssert(port?.enumeration == ["8443", "443"])

            XCTAssert(basePath?.defaultValue == "v2")
            XCTAssertNil(basePath?.description)
            XCTAssertNil(basePath?.enumeration)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }

    static var allTests = [
        ("testVersionDecoding", testVersionDecoding),
    ]
}
