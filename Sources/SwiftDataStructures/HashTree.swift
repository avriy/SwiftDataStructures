public struct Node<Value: Hashable>: Hashable {
    
    public let value: Value
    var children: Set<Node<Value>>
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    public var hashValue: Int {
        return value.hashValue
    }
    
    public init(value: Value, children: [Node] = []) {
        self.value = value
        self.children = Set(children)
    }
    
    public mutating func addChild(with value: Value) {
        let childNode = Node(value: value)
        children.insert(childNode)
    }
    
    public mutating func addChild(_ child: Node) {
        children.insert(child)
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        return "\(value)"
    }
}

extension Node {
    
    /// Finds path for a value using BFS
    ///
    /// - Parameter value: value to search for
    /// - Returns: path of the nodes up to a node with a given value
    public func path(for value: Value) -> [Node]? {
        let queue = LinkedListQueue(elements: self)
        var backTrace = [Node: Node]()
        var visited = Set<Node>()
        
        while let node = queue.dequeue() {
            visited.insert(node)
            if node.value == value {
                // found a node
                return node.trace(from: backTrace)
            }
            for child in node.children where !visited.contains(child) {
                queue.enqueue(element: child)
                backTrace[child] = node
            }
        }
        
        return nil
    }
    
    func bfsTraversal(handler: (Node) -> Void) {
        let queue = LinkedListQueue(elements: self)
        var visited = Set<Node>()
        
        while let node = queue.dequeue() {
            handler(node)
            visited.insert(node)
            for child in node.children where !visited.contains(child) {
                queue.enqueue(element: child)
            }
        }
    }
    
    func trace(from backtrace: [Node: Node]) -> [Node] {
        var result = [Node]()
        var pointer: Node? = self
        while let p = pointer {
            result.append(p)
            pointer = backtrace[p]
        }
        return result.reversed()
    }
}
