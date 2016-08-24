#if os(Linux)

import XCTest
@testable import LogTests

XCTMain([
    testCase(LogTests.allTests)
])

#endif
