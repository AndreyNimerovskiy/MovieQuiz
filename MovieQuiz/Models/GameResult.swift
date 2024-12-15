//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Mac on 10.12.2024.
//

import Foundation

struct GameResult {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBestScore(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
