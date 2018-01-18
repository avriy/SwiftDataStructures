import XCTest
import SwiftDataStructures

class AVLTreeTests: XCTestCase {
	
    func testBasicCases() {
		
		do {
			//		1
			//		 \
			//		  2
			//         \
			//	        3
			
			let tree = AVLTree(values: 1, 2, 3)
			
			XCTAssert(tree.contains(value: 1))
			XCTAssert(tree.contains(value: 2))
			XCTAssert(tree.contains(value: 3))
			
			var inorderTraversed = [Int]()
			tree.inorderTrafersal {
				inorderTraversed.append($0)
			}
			XCTAssertEqual(inorderTraversed, [1, 2, 3])
			
		}
		
		do {
			//		1
			//	     \
			//        3
			//       /
			//	    2
			
			let tree = AVLTree(values: 1, 3, 2)
			XCTAssert(tree.contains(value: 1))
			XCTAssert(tree.contains(value: 2))
			XCTAssert(tree.contains(value: 3))
			
			var inorderTraversed = [Int]()
			tree.inorderTrafersal {
				inorderTraversed.append($0)
			}
			XCTAssertEqual(inorderTraversed, [1, 2, 3])
		}
	
		do {
			//		3
			//	   /
			//    2
			//   /
			//	1
			
			let tree = AVLTree(values: 3, 2, 1)
			XCTAssert(tree.contains(value: 1))
			XCTAssert(tree.contains(value: 2))
			XCTAssert(tree.contains(value: 3))
			
			var inorderTraversed = [Int]()
			tree.inorderTrafersal {
				inorderTraversed.append($0)
			}
			XCTAssertEqual(inorderTraversed, [1, 2, 3])
		}
		
		do {
			//		3
			//	   /
			//    1
			//	   \
			//      2
			
			let tree = AVLTree(values: 3, 1, 2)
			XCTAssert(tree.contains(value: 1))
			XCTAssert(tree.contains(value: 2))
			XCTAssert(tree.contains(value: 3))
			
			var inorderTraversed = [Int]()
			tree.inorderTrafersal {
				inorderTraversed.append($0)
			}
			XCTAssertEqual(inorderTraversed, [1, 2, 3])
		}
		
		do {
			
			let tree = AVLTree(values: 5, 4, 3, 2, 1)
			var inorderTraversed = [Int]()
			tree.inorderTrafersal {
				inorderTraversed.append($0)
			}
			XCTAssertEqual(inorderTraversed, [1, 2, 3, 4, 5])
		}
    }
	
	func testBuildingBigTree() {
		_ =  AVLTree(values: Array(0...1_000_000))
	}


    static var allTests = [
        ("testRotations", testBasicCases),
    ]
}
