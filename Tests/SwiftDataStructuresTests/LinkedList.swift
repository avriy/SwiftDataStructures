import XCTest
@testable import SwiftDataStructures

class LinkedListTests: XCTestCase {
    
    func testExample() {
        let list = LinkedList.Node(values: [1, 2, 3, 4])
        XCTAssertEqual(list.description, "1 -> 2 -> 3 -> 4")
    }

    func testCopy() {
        let list = LinkedList.Node(values: Array(0..<1000))
        let listCopy = list.copy()
        
        for (element1, element2) in zip(sequence(first: list, next: { $0.next }), sequence(first: listCopy, next: { $0.next })) {
            XCTAssertEqual(element1.value, element2.value)
            XCTAssertEqual(element1.next == nil, element2.next == nil)
        }
    }
    
    func testReverse() {
        let array = Array(100...200)
        let list = LinkedList.Node(values: array)
        let reversed = list.reversed()
        let listSequence = sequence(first: reversed, next: { $0.next })
        for (reversedElement, arrayElement) in zip(listSequence, array.reversed()) {
            XCTAssertEqual(reversedElement.value, arrayElement)
        }
    }
    
    func testEnumeration() {
        let array = Array(10...20)
        var copy = [Int]()
        for node in LinkedList.Node(values: array) {
            copy.append(node.value)
        }
        XCTAssertEqual(array, copy)
        
    }

    static var allTests = [
        ("testExample", testExample), ("testCopy", testCopy), ("testReverse", testReverse), ("testEnumeration", testEnumeration)
    ]
}
