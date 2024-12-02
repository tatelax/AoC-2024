//
//  day1.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/1/24.
//

import Foundation

class Day1Part2 {
    static func run() {
        var contents: String = ""
        
        do {
            let path = "/Users/tatemccormick/Documents/Projects/AoC-2024/AoC-2024/day1/day1.txt"
            contents = try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            print("Error reading file: \(error)")
        }
        
        var a: [Int] = []
        var b: [Int] = []
        
        var i = 0
        
        var left = true
        
        while i < contents.count {
            let startIndex = contents.index(contents.startIndex, offsetBy: i)
            var endIndex = contents.index(contents.startIndex, offsetBy: i + 4)
            
            let subString = contents[startIndex...endIndex]
            
            let num = Int(String(subString))!
            
            if(left) {                
                let insertIndex = a.firstIndex(where: { $0 > num }) ?? a.count
                a.insert(num, at: insertIndex)
            }
            else {
                let insertIndex = b.firstIndex(where: { $0 > num }) ?? b.count
                b.insert(num, at: insertIndex)
            }
            
            endIndex = contents.index(endIndex, offsetBy: 1)
            let nextChar = String(contents[endIndex])
            
            if nextChar == " " {
                i += 8
            } else if nextChar == "\n" {
                i += 6
            }
            
            left = !left
        }
        
        var total = 0
        
        for i in 0..<a.count {
            var totalOccurences = 0

            for o in 0..<b.count {
                
                if a[i] == b[o] {
                    totalOccurences += 1
                }
            }

            total += a[i] * totalOccurences
        }
        
        print(total)
    }
}
