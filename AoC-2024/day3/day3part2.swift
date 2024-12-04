//
//  day2part2.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/2/24.
//

import Foundation

class Day3Part2 {
    static func run() {
        var input: String = ""
        
        do {
            let path = "/Users/tatemccormick/Documents/Projects/AoC-2024/AoC-2024/day3/day3.txt"
            input = try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            print("Error reading file: \(error)")
        }

        let pattern = "(?:mul\\((\\d{1,3}),(\\d{1,3})\\)|do\\(\\)|don't\\(\\))"
        
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(input.startIndex..<input.endIndex, in: input)
        
        var sum = 0
        
        // Find all matches in the input string
        let matches = regex.matches(in: input, options: [], range: range)
        
        var shouldMul = true
        
        for match in matches {
            let fullMatch = (input as NSString).substring(with: match.range)
            
            if match.range(at: 1).location != NSNotFound && shouldMul {
                // Extract the two numbers from each match
                if let firstRange = Range(match.range(at: 1), in: input),
                   let secondRange = Range(match.range(at: 2), in: input),
                   let num1 = Int(input[firstRange]),
                   let num2 = Int(input[secondRange]) {
                    // Multiply the numbers and add to sum
                    let product = num1 * num2
                    sum += product
                    
                    // Print each multiplication for debugging
                    print("Found: \(num1) * \(num2) = \(product)")
                }
            } else {
                if(fullMatch == "do()") {
                    shouldMul = true
                } else if fullMatch == "don't()" {
                    shouldMul = false
                }
            }

        }
        
        print(sum)
    }
}

