//
//  Queue.swift
//  State
//
//  Created by Maxim Khatskevich on 5/19/17.
//
//  https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue
//

import Foundation

/**
 General-purpose queue (FIFO) with elements of genertic type `T`.
 Credits to [Ray Wenderlich](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue).
 */
struct Queue<T>
{
    /**
     Internal storage where elements will be actually stored.
     */
    fileprivate
    var array = [T]()
    
    /**
     A Boolean value indicating whether the collection is empty: `true` if there is NO elements in the queue, `false` otherwise.
     
     - Note: When you need to check whether your queue is empty, use the
     `isEmpty` property instead of checking that the `count` property is
     equal to zero. Complexity: O(1).
     */
    var isEmpty: Bool
    {
        return array.isEmpty
    }
    
    /**
     Number of elements in the queue.
     */
    var count: Int
    {
        return array.count
    }
    
    /**
     The earliest added element, the same element that would be returned by `dequeue` element, or `nil`, if there is NO elements in the queue.
     */
    var front: T?
    {
        return array.first
    }
    
    /**
     Adds element to the queue.
     
     - Parameter element: The value to be added to the queue.
     */
    mutating
    func enqueue(_ element: T)
    {
        array.append(element)
    }
    
    /**
     Removes the earliest added element from the queue.
     
     - Returns: The earliest added element, or `nil`, if there were no elements in the queue at the moment when the function has been called.
     */
    mutating
    func dequeue() -> T?
    {
        if
            isEmpty
        {
            return nil
        }
        else
        {
            return array.removeFirst()
        }
    }
    
    /**
     Removes all elements from the queue, makes it empty.
     */
    mutating
    func reset()
    {
        array.removeAll()
    }
}
