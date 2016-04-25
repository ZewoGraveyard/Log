import XCTest
@testable import Log

class LogTests: XCTestCase {
    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is severely wrong here.")
    }
}

extension LogTests {
    static var allTests : [(String, LogTests -> () throws -> Void)] {
        return [
           ("testReality", testReality),
        ]
    }
}
