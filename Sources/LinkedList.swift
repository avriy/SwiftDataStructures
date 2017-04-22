public class LinkedList {
    public final class Node<T>: CustomStringConvertible {
        let value: T
        var next: Node?
        
        init(value: T, next: Node? = nil) {
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
    }

}

