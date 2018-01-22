public final class LinkedList<T>: CustomStringConvertible {
	
	private(set) var root: Node<T>?
	
	public init() {
		root = nil
	}
	
	public init(value: T) {
		root = Node(value: value)
	}
	
	private init(root: Node<T>) {
		self.root = root
	}
	
	public var isEmpty: Bool {
		return root == nil
	}
	
	public func insertFirst(_ value: T) {
		let newNode = Node(value: value)
		newNode.next = root
		root = newNode
	}
	
	public func append(value: T) {
		let newNode = Node(value: value)
		guard let root = root else {
			return self.root = newNode
		}
		var p = root
		while let next = p.next {
			p = next
		}
		p.next = newNode
	}
	
	public func dropLast() -> T? {
		guard let root = root else {
			return nil
		}
		var iterator = root, parent = root
		while let next = iterator.next {
			parent = iterator
			iterator = next
		}
		let result = iterator.value
		parent.next = nil
		return result
	}
	
	public func dropFirst() -> T? {
		let result = root?.value
		root = root?.next
		return result
	}
	
	public convenience init(values: [T]) {
		guard let firstValue = values.first else {
			fatalError("Array of values should not be empty if creating LinkedList")
		}
		
		self.init(value: firstValue)
		var last = root!
		
		for i in 1..<values.count {
			let newNode = Node(value: values[i])
			last.next = newNode
			last = newNode
		}
	}
	
	public func reverse() {
		root = root?.reversed()
	}
	
	public func reversed() -> LinkedList<T> {
		guard let root = root else {
			return LinkedList<T>()
		}
		return LinkedList(root: root.reversed())
	}
	
	public var description: String {
		guard let root = root else {
			return "Empty linked list"
		}
		return root.description
	}
	
	final class Node<T>: CustomStringConvertible {
        let value: T
        var next: Node?
        
        public init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }

        public var description: String {
            
            var result = ""
            for node in sequence(first: self, next: { $0.next }) {
                result += node.next == nil ? "\(node.value)" : "\(node.value) -> "
            }
            
            return result
        }
        
        func reversed() -> Node {
            
            var previous: Node = self
            var n: Node? = next
			
			previous.next = nil
			
            while let thisIterationN = n {
                
                let nNext = n?.next
                n?.next = previous
                previous = thisIterationN
                n = nNext
            }
            
            return previous
        }
    }
	
	deinit {
		
	}
	
    public class Iterator<T>: IteratorProtocol {
        
        var tail: Node<T>?
        
        init(start: Node<T>) {
            self.tail = start
        }
        
		public func next() -> T? {
            let result = tail
            tail = tail?.next
            return result?.value
        }
    }
}

extension LinkedList.Node: Sequence {
    public func makeIterator() -> LinkedList.Iterator<T> {
        return LinkedList.Iterator(start: self)
    }
}

