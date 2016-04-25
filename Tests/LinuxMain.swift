#if os(Linux)

import XCTest
@testable import LogTestSuite

XCTMain([
    testCase(LogTests.allTests)
])

#endif
