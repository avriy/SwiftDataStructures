import XCTest
@testable import SwiftDataStructures

class SwiftDataStructuresTests: XCTestCase {
    
    func testExample() {
        
        let list = Node.list(from: 1, 2, 3, 4)!
        
        XCTAssertEqual(list.description, "1 -> 2 -> 3 -> 4")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
