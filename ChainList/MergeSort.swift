//
//  MergeSort.swift
//  ChainList
//
//  Created by Lxk on 2019/4/19.
//  Copyright © 2019年 Lxk. All rights reserved.
//

import Foundation
class MergeClass {
    
    func mergeSort(array: [Int]) -> [Int] {
        var helper = Array(repeating: 0, count: array.count)
        var array = array
      mergeSort(array: &array, &helper, 0, array.count - 1)
        return array
    }
    
    func mergeSort( array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
        guard low < high else {
            return
        }
        let middle = (high - low) / 2 + low
        mergeSort(array:&array, &helper, low, middle)
        mergeSort(array:&array, &helper, middle + 1, high)
        merge(array:&array, &helper, low, middle, high)
    }
    
    func merge( array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
        for i in low ... high {
            helper[i] = array[i]
        }
        
        var helperLeft = low
        var helperRight = middle + 1
        var current = low
        
        while helperLeft <= middle && helperRight <= high {
            if helper[helperLeft] <= helper[helperRight] {
                array[current] = helper[helperLeft]
                helperLeft += 1
            } else {
                array[current] = helper[helperRight]
                helperRight += 1
            }
            current += 1
        }
        
        guard middle - helperLeft >= 0 else {
            return
        }
        for i in 0 ... middle - helperLeft {
            array[current + i] = helper[helperLeft + i]
        }
    }
}
