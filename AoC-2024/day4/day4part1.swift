//
//  day4part1.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/5/24.
//



class Day4Part1 {
    static let directions: [(x: Int, y: Int)] =
    [
        (1, 0),
        (-1, 0),
        (0, 1),
        (0, -1),
        (-1, 1),
        (1, -1),
        (1, 1),
        (-1, -1)
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
                totalMatches += checkForMatch(map, x, y)
            }
        }
        
        print(totalMatches)
    }
    
    static func checkForMatch(_ data: [[Character]], _ x: Int, _ y: Int) -> Int {
        let xmas = "XMAS"
        var matches = 0
        
        for direction in directions {
            var match = true
            
            for i in 0..<xmas.count {
                let newX = x + (direction.x * i)
                let newY = y + (direction.y * i)
                
                guard newX >= 0 && newX < data[0].count && newY >= 0 && newY < data.count else {
                    match = false
                    break
                }
                
                if(data[newY][newX] != xmas[xmas.index(xmas.startIndex, offsetBy: i)]) {
                    match = false
                    break
                }
            }
            
            if match {
                matches += 1
            }
        }
        
        return matches
    }
}
