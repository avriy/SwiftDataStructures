import XCTest
import SwiftDataStructures

class QueueTests: XCTestCase {
    
    func testEnqueueDequeueLinkedList() {
        let data = Array(0..<100_000)
        let queue = LinkedListQueue<Int>()
        queue.testEnqueueDequeue(data)
    }
    
    func testEnqueueDequeueArray() {
        let data = Array(0..<100_000)
        let queue = ArrayQueue<Int>()
        queue.testEnqueueDequeue(data)
    }
    
    static var allTests = [
        ("testEnqueueDequeueLinkedList", testEnqueueDequeueLinkedList),
        ("testEnqueueDequeueArray", testEnqueueDequeueArray),
        ]
}

extension Queue where T: Equatable {
    func testEnqueueDequeue(_ values: [T]) {
        
        for value in values {
            enqueue(element: value)
        }
        
        for value in values {
            guard let dequeued = dequeue() else {
                fatalError()
            }
            XCTAssertEqual(value, dequeued)
        }
    }
}
