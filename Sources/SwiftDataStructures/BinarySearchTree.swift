protocol BinarySearchTree {
	associatedtype Value: Comparable
	func contains(value: Value) -> Bool
	func insert(value: Value)
}
