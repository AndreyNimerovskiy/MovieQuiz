//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Mac on 10.12.2024.
//

import UIKit

protocol StatisicServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(correct count: Int, total amount: Int)
}
