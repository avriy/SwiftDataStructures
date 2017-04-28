public class LinkedList {
    public final class Node<T>: CustomStringConvertible {
        let value: T
        var next: Node?
        
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
        
        convenience init(values: [T]) {
            guard let firstValue = values.first else {
                fatalError("Array of values should not be empty if creating LinkedList")
            }
            
            self.init(value: firstValue)
            var last = self
            
            for i in 1..<values.count {
                let newNode = Node(value: values[i])
                last.next = newNode
                last = newNode
            }
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
            
            var nPrevious: Node = self
            var n: Node? = self.next
            
            while let thisIterationN = n {
                
                let nNext = n?.next
                n?.next = nPrevious
                nPrevious = thisIterationN
                n = nNext
            }
            
            return nPrevious
            
        }
        
        func copy() -> Node {
            var node: Node? = self
            
            let resultHead = Node(value: self.value)
            var resultTail = resultHead
            while true {
                guard let value = node?.next?.value else {
                    break
                }
                let new = Node(value: value)
                resultTail.next = new
                resultTail = new
                node = node?.next
            }
            
            return resultHead
            
        }
    }
    
    public class Iterator<T>: IteratorProtocol {
        
        let start: Node<T>
        var tail: Node<T>?
        
        init(start: Node<T>) {
            self.start = start
            self.tail = start
        }
        
        public func next() -> Node<T>? {
            let result = tail
            tail = tail?.next
            return result
        }
        
    }

}

extension LinkedList.Node: Sequence {
    public func makeIterator() -> LinkedList.Iterator<T> {
        return LinkedList.Iterator(start: self)
    }
}

