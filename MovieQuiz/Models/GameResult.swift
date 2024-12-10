//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Mac on 10.12.2024.
//

import UIKit

struct GameResult: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
