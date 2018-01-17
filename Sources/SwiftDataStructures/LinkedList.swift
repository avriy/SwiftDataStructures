public final class LinkedList<T>: CustomStringConvertible {
	
	private var root: Node<T>
	
	init(value: T) {
		root = Node(value: value)
	}
	
	private init(root: Node<T>) {
		self.root = root
	}
	
	public convenience init(values: [T]) {
		guard let firstValue = values.first else {
			fatalError("Array of values should not be empty if creating LinkedList")
		}
		
		self.init(value: firstValue)
		var last = root
		
		for i in 1..<values.count {
			let newNode = Node(value: values[i])
			last.next = newNode
			last = newNode
		}
	}
	
	public func reversed() -> LinkedList<T> {
		return LinkedList(root: root.reversed())
	}
	
	public var description: String {
		return root.description
	}
	
    final class Node<T>: CustomStringConvertible {
        let value: T
        var next: Node?
        
        public init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }

        
        static func list(from values: T...) -> Node? {
            guard let firstValue = values.first else {
                return nil
            }
            
            let first = Node(value: firstValue)
            var last = first
            
            for i in 1..<values.count {
                let newNode = Node(value: values[i])
                last.next = newNode
                last = newNode
            }
            
            return first
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
            var n: Node? = self.next
            
            while let thisIterationN = n {
                
                let nNext = n?.next
                n?.next = previous
                previous = thisIterationN
                n = nNext
            }
            
            return previous
            
        }
    }
    
    public class Iterator<T>: IteratorProtocol {
        
        let start: Node<T>
        var tail: Node<T>?
        
        init(start: Node<T>) {
            self.start = start
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

