//
//  ChainList.swift
//  ChainList
//
//  Created by Lxk on 2019/4/16.
//  Copyright © 2019年 Lxk. All rights reserved.
//

import Foundation
class ListNode{
    var value : Int
    var next: ListNode?;
    
    init(value : Int) {
        self.value = value
        self.next = nil
    }
}

class List {
    var tail : ListNode?
    var  head : ListNode?
    init() {
        head = ListNode(value: 0)
        tail = head
    }
    //尾插法
    func appendToTail(_ val : Int) {
        let node  = ListNode(value: val)
        if tail == nil {
            tail = node
            head = tail
        }else{
            tail?.next = node
            tail! = node
        }
    }
    
    //头插法
    func appendToHead(_ val : Int) {
        let node = ListNode(value: val);
        if head == nil{
            head = node
            head = tail
        }else{
            node.next = head
            head = node
        }
    }
    
    //把一个链表按 小于某个值的在左边,大于的在右边排序,链表顺序不变
    func partition(_ head : ListNode?, _ x : Int) -> ListNode? {
        let prevDummy = ListNode(value: 0)
        var prev  = prevDummy
        let postDummy = ListNode(value: 0)
        var post = postDummy
        
        var node = head
        //尾插法
        while node != nil {
            if node!.value < x {
                prev.next = node
                prev = node!
            }else{
                post.next = node
                post = node!
            }
            node = node!.next
        }
        
        //左右拼接
        post.next = nil
        post.next = postDummy.next
        return prevDummy
    }
    
    //检测 链表是否有环
    // 原理: 快行指针,两个指针,一个在前一个在后,或者一个的速度是另一个的两倍,遍历链表,如果两个指针值相等就说明存在环
    func hasCircle(_ head : ListNode?) -> Bool {
        var slow  = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast {
                return true
            }
        }
        return false
    }
    
    //删除倒数第 n 个结点
    // 思路 :使用快行指针,两个指针移动速度一样,第一个指针 在第二个指针前面 n 个结点, 所以当第一个结点移动到最后一个结点的时候,第二个指针就指向倒数第 n 个结点
    func removeFromeEnd(head : ListNode?,n : Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        let  dummy = ListNode(value: 0)
        dummy.next = head
        var prev: ListNode? = dummy
        var post : ListNode? = dummy
        
        for _ in 0..<n{
            if post == nil {
                break
            }
            post = post!.next
        }
        
        while post != nil && post!.next != nil {
            prev = prev!.next
            post = post!.next
        }
        //删除结点
        prev!.next = prev!.next!.next
        return dummy.next
    }
}
