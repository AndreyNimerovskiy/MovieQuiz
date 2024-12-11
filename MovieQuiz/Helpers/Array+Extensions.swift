//
//  Array+Extensions.swift
//  MovieQuiz
//
//  Created by Mac on 11.12.2024.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        indices ~= index ? self[index] : nil
    }
}
