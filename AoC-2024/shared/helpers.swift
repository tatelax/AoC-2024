//
//  helpers.swift
//  AoC-2024
//
//  Created by Tate McCormick on 12/2/24.
//

func convertStringToIntMatrix(_ input: String) -> [[Int]] {
    let lines = input.split(separator: "\n").map(String.init)
    
    return lines.map { line in
           line.split(separator: " ")
              .map(String.init)
              .compactMap(Int.init)
    }
}
