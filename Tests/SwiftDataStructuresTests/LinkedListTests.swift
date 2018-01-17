import XCTest
@testable import SwiftDataStructures

class LinkedListTests: XCTestCase {
    
    func testExample() {
        let list = LinkedList(values: [1, 2, 3, 4])
        XCTAssertEqual(list.description, "1 -> 2 -> 3 -> 4")
    }
    
    func testReverse() {
        let array = Array(100...200)
        let list = LinkedList(values: array)
        let reversed = list.reversed()
		
    }
	
    static var allTests = [
        ("testExample", testExample), ("testReverse", testReverse)
    ]
}
