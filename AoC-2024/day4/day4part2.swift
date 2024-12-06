//
//  day4part2.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/5/24.
//

class Day4Part2 {
    func run() {
        var input: String = ""
        
        do {
            let path = "/Users/tatemccormick/Documents/Projects/AoC-2024/AoC-2024/day4/day4.txt"
            input = try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            print("Error reading file: \(error)")
        }
    }
}
