import XCTest
@testable import SwiftDataStructures

class QueueTests: XCTestCase {
    
    func testEnqueueDequeueLinkedList() {
        let data = Array(0..<100000)
        let queue = Queue<Int>()
        queue.testEnqueueDequeue(data)
    }
    
    func testEnqueueDequeueArray() {
        let data = Array(0..<100000)
        let queue = ArrayQueue<Int>()
        queue.testEnqueueDequeue(data)
    }
    
    static var allTests = [
        ("testEnqueueDequeueLinkedList", testEnqueueDequeueLinkedList),
        ("testEnqueueDequeueArray", testEnqueueDequeueArray),
        ]
}

extension QueueProtocol where T: Equatable {
    func testEnqueueDequeue(_ values: [T]) {
        
        for value in values {
            enqueue(with: value)
        }
        
        for value in values {
            guard let dequeued = dequeue() else {
                fatalError()
            }
            XCTAssertEqual(value, dequeued)
        }
    }
}
