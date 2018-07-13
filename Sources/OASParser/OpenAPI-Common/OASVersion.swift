
/// Version following the SemVer 2.0.0 rules
public enum OASVersion {
    indirect case subversion(UInt, OASVersion)
    case version(UInt)

    public var major: UInt { return self.value }
    public var minor: UInt? { return self.subversion?.value }
    public var patch: UInt? { return self.subversion?.subversion?.value }

    public init(_ string: String) throws {
        let components = string.components(separatedBy: ".")
        var integerComponents = try components.map { component -> UInt in
            if let int = UInt(component) {
                return int
            }

            throw DecodingError("Unable to parse version component \(component) into integer")
        }

        guard let lastComponent = integerComponents.popLast(), integerComponents.count >= 2 else {
            throw DecodingError("Version components were less than 2")
        }

        self = integerComponents
            .reversed()
            .reduce(OASVersion.version(lastComponent)) { subversion, component in
                return OASVersion.subversion(component, subversion)
        }
    }

    // MARK: Private methods

    private var value: UInt {
        switch self {
        case .subversion(let version, _):
            return version
        case .version(let version):
            return version
        }
    }

    private var subversion: OASVersion? {
        switch self {
        case .subversion(_, let subversion):
            return subversion
        case .version:
            return nil
        }
    }
}

// MARK: - Version + Codable

extension OASVersion: Codable {
    
    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        let versionString = try value.decode(String.self)
        try self.init(versionString)
    }

    public func encode(to encoder: Encoder) throws {
        let value = self.map { $0.value.description }.joined(separator: ".")
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

// MARK: - Version + Sequence

extension OASVersion: Sequence {

    public struct Iterator: IteratorProtocol {
        private var version: OASVersion?

        init(version: OASVersion?) {
            self.version = version
        }

        public mutating func next() -> OASVersion? {
            guard let version = self.version else {
                return nil
            }

            if case .subversion(_, let subversion) = version {
                self.version = subversion
            } else {
                self.version = nil
            }

            return version
        }
    }

    public func makeIterator() -> Iterator {
        return Iterator(version: self)
    }

    public var components: [UInt] {
        return self.map { $0.value }
    }
}

// MARK: - Version + CustomStringConvertible

extension OASVersion: CustomStringConvertible {
    public var description: String {
        return self.map { String($0.value) }.joined(separator: ".")
    }
}

// MARK: - Version + Equatable

extension OASVersion: Equatable {
    public static func ==(left: OASVersion, right: OASVersion) -> Bool {
        let leftArray = left.map { $0.value }
        let rightArray = right.map { $0.value }
        return leftArray == rightArray
    }
}

// MARK: - Version + Comparable

extension OASVersion: Comparable {
    public static func <(left: OASVersion, right: OASVersion) -> Bool {
        let leftArray = left.components
        let rightArray = right.components
        for (index, value) in rightArray[0..<leftArray.count].enumerated() {
            let leftValue = leftArray[index]
            switch leftValue {
            case ..<value:
                return true
            case value...:
                return false
            default:
                continue
            }
        }

        if rightArray.count <= leftArray.count {
            return false
        }

        return rightArray[leftArray.count...].contains { $0 > 0 }
    }
}

