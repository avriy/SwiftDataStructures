public protocol Queue {
    associatedtype T
    func enqueue(element value: T)
    func dequeue() -> T?
}

public final class LinkedListQueue<T>: Queue {
    
    private var head: LinkedList<T>.Node<T>?
    private weak var tail: LinkedList<T>.Node<T>?
    
	public func enqueue(element value: T) {
        let node = LinkedList<T>.Node(value: value)
        if head == nil {
            head = node
        } else {
            tail!.next = node
        }
        tail = node
    }
    
	public func dequeue() -> T? {
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

public final class ArrayQueue<T>: Queue {
    
    private var array = [T]()
	
	public init() {
	}
	
    public func enqueue(element value: T) {
        array.append(value)
    }
    
    public func dequeue() -> T? {
        guard !array.isEmpty else { return nil }
        return array.removeFirst()
    }
    
}
