public final class AVLTree<ValueType: Comparable> {
	
	fileprivate private(set) var root: Node<ValueType>
	fileprivate private(set) var size = 0
	public init(value: ValueType) {
		self.root = Node(value: value)
	}
	
	public init(values: ValueType...) {
		guard let firstValue = values.first else {
			fatalError("array is empty")
		}
		root = Node(value: firstValue)
		for value in values[1..<values.count] {
			insert(value: value)
		}
	}
	
	public init(values: [ValueType]) {
		guard let firstValue = values.first else {
			fatalError("array is empty")
		}
		root = Node(value: firstValue)
		for value in values[1..<values.count] {
			insert(value: value)
		}
	}
	
	final fileprivate class Node<ValueType: Comparable> {
		
		let value: ValueType
		var height = 0
		var leftNode: Node?
		var rightNode: Node?
		
		init(value: ValueType) {
			self.value = value
		}
		
		var rightSize: Int {
			guard let rn = rightNode else {
				return 0
			}
			return rn.height + 1
		}
		
		var leftSize: Int {
			guard let ln = leftNode else {
				return 0
			}
			return ln.height + 1
		}
		
		var balanceFactor: Int {
			return leftSize - rightSize
		}
		
		var isBalanced: Bool {
			return abs(balanceFactor) < 2
		}
		
		func contains(value: ValueType) -> Bool {
			
			var iterator = self
			
			while true {
				if iterator.value == value {
					return true
				} else if value < iterator.value {
					guard let left = iterator.leftNode else {
						return false
					}
					iterator = left
				} else {
					guard let right = iterator.rightNode else {
						return false
					}
					iterator = right
				}
			}
		}
		
		fileprivate func updateSize() {
			height = max(leftSize, rightSize)
		}
		
		fileprivate func inorderTraversal(block: (ValueType) -> Void) {
			leftNode?.inorderTraversal(block: block)
			block(value)
			rightNode?.inorderTraversal(block: block)
		}
	}
	
	public func inorderTrafersal(block: (ValueType) -> Void) {
		return root.inorderTraversal(block: block)
	}
}

private enum Rotation: Int {
	case leftLeft, leftRight, rightLeft, rightRight
}

extension AVLTree.Node {
	fileprivate var rotationNeeded: Rotation? {
		if let ln = leftNode, balanceFactor > 1 {
			if ln.balanceFactor > 0 {
				return .leftLeft
			}
			if ln.balanceFactor < 0 {
				return .leftRight
			}
		}
		
		if let rn = rightNode, balanceFactor < 1 {
			if rn.balanceFactor > 0 {
				return .rightLeft
			}
			if rn.balanceFactor < 0 {
				return .rightRight
			}
		}
		
		return nil
	}

}

extension AVLTree: BinarySearchTree {
	
	public func contains(value: ValueType) -> Bool {
		return root.contains(value: value)
	}
	
	func unbalanceInsert(value: ValueType) {
		
	}
	
	func insert(value: ValueType) {
		let newNode = Node(value: value)
		
		var iterator = root
		var shouldIterate = true
		
		var nodes = [Node<ValueType>]()
		
		while shouldIterate {
			nodes.append(iterator)
			
			if iterator.value == value {
				return
			} else if iterator.value > value {
				guard let left = iterator.leftNode else {
					nodes.append(newNode)
					iterator.leftNode = newNode
					size += 1
					iterator.height = max(iterator.height, 1)
					shouldIterate = false
					continue
				}
				iterator = left
			} else {
				guard let right = iterator.rightNode else {
					nodes.append(newNode)
					iterator.rightNode = newNode
					size += 1
					iterator.height = max(iterator.height, 1)
					shouldIterate = false
					continue
				}
				iterator = right
			}
		}
		
		for i in 0..<nodes.count {
			nodes[i].height = max(nodes[i].height, nodes.count - 1 - i)
		}
		
		for i in 0..<(nodes.count-1) {
			let parent = nodes[nodes.count - 2 - i]
			let child = nodes[nodes.count - 1 - i]
			guard !child.isBalanced else {
				continue
			}
			if parent.leftNode === child {
				parent.leftNode = rotate(node: child)
			} else if parent.rightNode === child {
				parent.rightNode = rotate(node: child)
			}
			parent.updateSize()
		}

		if !root.isBalanced {
			root = rotate(node: root)
			root.updateSize()
		}

	}
	

	private func rotate(node: Node<ValueType>) -> Node<ValueType> {
		
		guard let rotation = node.rotationNeeded else {
			return node
		}
		
		switch rotation {
		case .rightRight: return leftRotate(node: node)
		case .leftLeft: return rightRotate(node: node)
		case .leftRight:
			node.leftNode = leftRotate(node: node.leftNode!)
			return rightRotate(node: node)
		case .rightLeft:
			node.rightNode = rightRotate(node: node.rightNode!)
			return leftRotate(node: node)
		}
	}
	
	private func rightRotate(node: Node<ValueType>) -> Node<ValueType> {
		let a = node
		let b = node.leftNode!
		a.leftNode = nil
		b.rightNode = a
		a.updateSize()
		b.updateSize()
		return b
	}
	
	private func leftRotate(node: Node<ValueType>) -> Node<ValueType> {
		let a = node
		let b = node.rightNode!
		a.rightNode = nil
		b.leftNode = a
		a.updateSize()
		b.updateSize()
		return b
	}
	
}
