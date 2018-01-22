import XCTest
import SwiftDataStructures

class LinkedListTests: XCTestCase {
    
    func testDescription() {
        XCTAssertEqual(LinkedList(values: [1, 2, 3, 4]).description, "1 -> 2 -> 3 -> 4")
		XCTAssertEqual(LinkedList(values: [11]).description, "11")
		do {
			let list = LinkedList(values: [1])
			_ = list.dropFirst()
			XCTAssertEqual(list.description, "Empty linked list")
		}
    }
	
	func testInsertRemoveFirst() {
		do {
			let originalArray = [1, 5, 7]
			let list = LinkedList(values: originalArray)
			var values = [Int]()
			while let value = list.dropFirst() {
				values.append(value)
			}
			XCTAssertEqual(originalArray, values)
		}
		do {
			let list = LinkedList(values: ["a", "b", "c", "d"])
			list.insertFirst("r")
			XCTAssertEqual(list.dropFirst(), "r")
		}
		
		do {
			let list = LinkedList<Int>()
			for i in Array(0..<10) {
				list.insertFirst(i)
			}
			var values = [Int]()
			while let value = list.dropFirst() {
				values.append(value)
			}
			
			XCTAssertEqual(values, Array(0..<10).reversed())
		}
	}
	
	func testAppend() {
		do {
			let list = LinkedList(value: "b")
			list.insertFirst("a")
			list.append(value: "c")
			var values = [String]()
			while let value = list.dropFirst() {
				values.append(value)
			}
			XCTAssertEqual(values, ["a", "b", "c"])
		}
		
		do {
			let list = LinkedList(values: [14.5, 15, 17.8])
			XCTAssertEqual(list.dropLast(), 17.8)
			XCTAssertEqual(list.dropLast(), 15)
			XCTAssertEqual(list.dropLast(), 14.5)
		}
		
		do {
			let list = LinkedList<Int>()
			for i in Array(0..<10) {
				list.append(value: i)
			}
			var values = [Int]()
			while let value = list.dropFirst() {
				values.append(value)
			}
			
			XCTAssertEqual(values, Array(0..<10))
		}
	}
	
	func testEmpty() {
		let list = LinkedList<Int>()
		XCTAssert(list.isEmpty, "List should be empty")
		list.insertFirst(10)
		XCTAssert(!list.isEmpty, "List should not be empty")
		_ = list.dropFirst()
		XCTAssert(list.isEmpty, "List should be empty")
	}
	
    func testReverse() {
		do {
			let list = LinkedList<Int>()
			let reversed = list.reversed()
			XCTAssert(reversed.isEmpty, "Reverse of empty array should be empty")
		}
		
		do {
			let array = Array(1...5)
			let list = LinkedList(values: array)
			XCTAssertEqual(list.reversed().description, "5 -> 4 -> 3 -> 2 -> 1")
		}
		
		do {
			let a = ["Alice", "Bob"]
			let list = LinkedList(values: a)
			list.reverse()
			var values = [String]()
			while let value = list.dropFirst() {
				values.append(value)
			}
			XCTAssertEqual(values, ["Bob", "Alice"])
		}
    }
	
	func testLoad() {
		let list = LinkedList<Int>()
		for i in 0..<10_000_000 {
			list.insertFirst(i)
		}
		XCTAssert(true)
	}
	
    static var allTests = [
		("testDescription", testDescription),
		("testInsertRemoveFirst", testInsertRemoveFirst),
		("testAppend", testAppend),
		("testEmpty", testEmpty),
		("testReverse", testReverse),
		("testLoad", testLoad)
    ]
}
