//
//  day2part2.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/2/24.
//

//
//  day2part1.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/2/24.
//

class Day2Part2 {
    static func run() {
        var contents: String = ""
        
        do {
            let path = "/Users/tatemccormick/Documents/Projects/AoC-2024/AoC-2024/day2/day2.txt"
            contents = try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            print("Error reading file: \(error)")
        }
        
        let reports = convertStringToIntMatrix(contents)
            .filter {
                reportIsSafeWithDampener($0)
            }
        
        print(reports.count)
    }
    
    static func reportIsSafe(_ report: [Int]) -> Bool {
        let increasing = report[0] < report[1]
        let decreasing = increasing == false
        
        for i in 0..<report.count - 1 {
            // Check if within difference allowance
            let difference = abs(report[i] - report[i + 1])
            if difference < 1 || difference > 3 {
                return false
            }
            
            // Check if all increasing or decreasing
            if increasing && report[i] > report[i + 1] {
                return false
            } else if decreasing && report[i] < report[i + 1] {
                return false
            }
        }

        return true
    }
    
    
    static func reportIsSafeWithDampener(_ report: [Int]) -> Bool {
        guard reportIsSafe(report) == false else {
            return true
        }
        
        for i in 0 ..< report.count {
            var dampenedReport = [Int]()
            for j in 0 ..< report.count {
                if j != i {
                    dampenedReport.append(report[j])
                }
            }
            
            if reportIsSafe(dampenedReport) {
                return true
            }
        }
        
        return false
    }
    
    static func convertStringToIntMatrix(_ input: String) -> [[Int]] {
        let lines = input.split(separator: "\n").map(String.init)
        
        return lines.map { line in
               line.split(separator: " ")
                  .map(String.init)
                  .compactMap(Int.init)
        }
    }
}

