//
//  day5part1.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/6/24.
//

class Day5Part1 {
    static func run() {
        var input: String = ""
        
        do {
            let path = "/Users/tatemccormick/Documents/Projects/AoC-2024/AoC-2024/day5/day5.txt"
            input = try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            print("Error reading file: \(error)")
        }
        
        let sections = input.split(separator: "\n\n")
        let pageRules = sections[0].split(separator: "\n")
        let manualsToProduce = sections[1].split(separator: "\n")
        
        // Key=Page, Value=Pages that must come after the key
        var rulesDict: [Int: [Int]] = [:]
        var mustComeAfter: [Int: [Int]] = [:]
        
        for page in pageRules {
            let rules = page.split(separator: "|")
            
            let before = Int(rules[0])!
            let after = Int(rules[1])!
            
            if rulesDict[before] == nil {
                rulesDict[before] = [after]
            } else {
                rulesDict[before]!.append(after)
            }

            if mustComeAfter[after] == nil {
                mustComeAfter[after] = [before]
            } else {
                mustComeAfter[after]!.append(before)
            }
        }
        
        var validManuals: [Int] = []
        
        // "75,47,61,53,29"
        for i in 0..<manualsToProduce.count {
            // ["75","47","61","53","29"]
            let pages = String(manualsToProduce[i]).split(separator: ",")
            let pagesAsInt = pages.map { Int($0)! }
            
            var isValid = true
            
            mainLoop: for currentIndex in 0..<pagesAsInt.count {
                let currentPage = pagesAsInt[currentIndex]
                
                if let mustComeBefore = mustComeAfter[currentPage] {
                    for required in mustComeBefore {
                        if pagesAsInt.contains(required) {
                            let requiredIndex = pagesAsInt.firstIndex(of: required)!
                            if requiredIndex > currentIndex {
                                isValid = false
                                break mainLoop
                            }
                        }
                    }
                }
                
                if let mustComeAfterThis = rulesDict[currentPage] {
                    for required in mustComeAfterThis {
                        if pagesAsInt.contains(required) {
                            let requiredIndex = pagesAsInt.firstIndex(of: required)!
                            if requiredIndex < currentIndex {
                                isValid = false
                                break mainLoop
                            }
                        }
                    }
                }
            }
            
            if isValid {
                validManuals.append(i)
            }
        }
        
        print("DONE!")
        
        var result = 0
        
        for i in validManuals {
            let pages = String(manualsToProduce[i]).split(separator: ",")
            let pagesAsInt = pages.map { Int($0.trimmingCharacters(in: .whitespaces)) ?? 0 }
            
            let middleIndex = pagesAsInt.count / 2
            
            result += pagesAsInt[middleIndex]
        }
        
        print(result)
    }
}
