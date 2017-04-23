import XCTest
@testable import SwiftDataStructures

class LinkedListTests: XCTestCase {
    
    func testExample() {
        let list = LinkedList.Node.list(from: 1, 2, 3, 4)!
        XCTAssertEqual(list.description, "1 -> 2 -> 3 -> 4")
    }

    func testCopy() {
        let list = LinkedList.Node.list(from: Array(0..<1000))!
        let listCopy = list.copy()
        
        for (element1, element2) in zip(sequence(first: list, next: { $0.next }), sequence(first: listCopy, next: { $0.next })) {
            XCTAssertEqual(element1.value, element2.value)
            XCTAssertEqual(element1.next == nil, element2.next == nil)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
