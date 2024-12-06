//
//  day4part2.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/5/24.
//

class Day4Part2 {
    static let directions: [(x: Int, y: Int)] =
    [
        (-1, -1),
        (1, -1),
        (1, 1),
        (-1, 1)
    ]
    
    static func run() {
        var totalMatches = 0
        var input: String = ""
        
        do {
            let path = "/Users/tatemccormick/Documents/Projects/AoC-2024/AoC-2024/day4/day4.txt"
            input = try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            print("Error reading file: \(error)")
        }
        
        let split = input.split(separator: "\n")
        let map = split.map { row in
            return Array(row)
        }
        
        for y in 0..<map.count {
            for x in 0..<map[y].count {
                if map[y][x] == "A" {
                    totalMatches += checkForMatch(map, x, y) == true ? 1 : 0
                }
            }
        }
        
        print(totalMatches)
    }
    
    static func checkForMatch(_ data: [[Character]], _ x: Int, _ y: Int) -> Bool {
        let matches = [
            "MSSM",
            "SSMM",
            "SMMS",
            "MMSS"
        ]
        
        for match in matches {
            var currChar = 0
            var didMatch = true
            
            for direction in directions {
                let newX = x + direction.x
                let newY = y + direction.y
                    
                guard newX >= 0 && newX < data[0].count && newY >= 0 && newY < data.count else {
                    didMatch = false
                    break
                }
                
                let index = match.index(match.startIndex, offsetBy: currChar)
                
                if data[newY][newX] != match[index] {
                    didMatch = false
                    break
                }

                currChar += 1
            }
            
            if didMatch {
                return didMatch
            }
        }

        return false
    }
}
