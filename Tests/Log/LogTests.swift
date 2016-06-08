import XCTest
@testable import Log

class LogTests: XCTestCase {
    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is severely wrong here.")
    }

    func testStandardOutputAppender() {
        let logger = Logger()
        struct TestError: ErrorProtocol { let description: String }
        logger.log("Stuff failed pretty badly", error: TestError(description: "Everything failed badly"))
        // should print out something like
        // [1465345612][/Users/dan/Developer/projects/Zewo/Development/Log/Tests/Log/LogTests.swift:testStandardOutputAppender():12:19]: Stuff failed pretty badly: (TestError #1)(description: "Everything failed badly")
    }
}

extension LogTests {
    static var allTests: [(String, (LogTests) -> () throws -> Void)] {
        return [
           ("testReality", testReality),
           ("testStandardOutputAppender", testStandardOutputAppender),
        ]
    }
}
