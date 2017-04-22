protocol QueueProtocol {
    associatedtype T
    func enqueue(element value: T)
    func dequeue() -> T?
}

public final class Queue<T>: QueueProtocol {
    
    private var head: LinkedList.Node<T>?
    private weak var tail: LinkedList.Node<T>?
    
    func enqueue(element value: T) {
        let node = LinkedList.Node(value: value)
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
    
    public init() {
        
    }
    
    public init(elements: T...) {
        for element in elements {
            enqueue(element: element)
        }
        
    }
}

final class ArrayQueue<T>: QueueProtocol {
    
    private var array = [T]()
    
    func enqueue(element value: T) {
        array.append(value)
    }
    
    func dequeue() -> T? {
        guard !array.isEmpty else { return nil }
        return array.removeFirst()
    }
    
}
