import XCTest
@testable import SwiftDataStructures

class HashTreeTests: XCTestCase {
    
    func testfindingPathInATree() {
        var root = Node(value: 10)
        root.addChild(with: 4)
        var nodeWithChild = Node(value: 19)
        nodeWithChild.addChild(with: 21)
        root.addChild(nodeWithChild)
        
        guard let path = root.path(for: 21) else {
            return
        }
        XCTAssertEqual(path.map({ $0.value }), [10, 19, 21])
        print("path is \(path)")
    }
    
    static var allTests = [
        ("testfindingPathInATree", testfindingPathInATree),
        ]
    
}

