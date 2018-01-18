import XCTest
import SwiftDataStructures

class LinkedListTests: XCTestCase {
    
    func testExample() {
        let list = LinkedList(values: [1, 2, 3, 4])
        XCTAssertEqual(list.description, "1 -> 2 -> 3 -> 4")
    }
    
    func testReverse() {
        let array = Array(1...5)
        let list = LinkedList(values: array)
		XCTAssertEqual(list.reversed().description, "5 -> 4 -> 3 -> 2 -> 1")
    }
	
    static var allTests = [
        ("testExample", testExample), ("testReverse", testReverse)
    ]
}
