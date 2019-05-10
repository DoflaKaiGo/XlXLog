//
//  ViewController.swift
//  ChainList
//
//  Created by Lxk on 2019/4/16.
//  Copyright © 2019年 Lxk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _  =   MergeClass().mergeSort(array: [2,5,9,3,6,1,7,4,8])
        for n in 1 ..< 20 {
            print(Fib(n: n))
        }
////
        print("-----\(fib(n: 10))")
        ////
        let addTen = add(10)
      print( addTen(5))
    }

    func Fib(n : Int) -> Int {
        var (prev, curr) = (0, 1)
        for _ in 1 ..< n {
            (curr, prev) = (curr + prev, curr)
        }
        return curr
    }
    
    func fib(n : Int) -> Int {
        guard n > 0 else {
            return 0
        }
        if n == 1 || n == 2 {
            return 1
        }
        return fib(n:n - 1) +  fib(n:n - 2)
    }
    
    func add(_ num: Int) -> (Int) -> Int {
        return {
            return num + $0
        }
    }
}

