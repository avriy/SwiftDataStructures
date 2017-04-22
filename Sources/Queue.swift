protocol QueueProtocol {
    associatedtype T
    func enqueue(with value: T)
    func dequeue() -> T?
}

public final class Queue<T>: QueueProtocol {
    
    private var head: Node<T>?
    private weak var tail: Node<T>?
    
    func enqueue(with value: T) {
        let node = Node(value: value)
        if head == nil {
            head = node
        } else {
            tail!.next = node
        }
        tail = node
    }
    
    func dequeue() -> T? {
        guard let startNode = head else {
            return nil
        }
        
        let res = startNode.value
        self.head = startNode.next
        return res
    }
    
    var isEmpty: Bool {
        return head == nil
    }
}

class ArrayQueue<T>: QueueProtocol {
    
    private var array = [T]()
    
    func enqueue(with value: T) {
        array.append(value)
    }
    
    func dequeue() -> T? {
        guard !array.isEmpty else { return nil }
        return array.removeFirst()
    }
    
}
