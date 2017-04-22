import XCTest
@testable import SwiftDataStructuresTests

XCTMain([
    testCase(LinkedListTests.allTests), testCase(QueueTests.allTests), testCase(HashTreeTests.allTests)
])
