//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Mac on 10.12.2024.
//

import Foundation


class QuestionFactory: QuestionFactoryProtocol {
    
    weak var delegate: QuestionFactoryDelegate?
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Руйтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Рейтинг данного фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Рейтинг данного фильма больше 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Рейтинг данного фильма больше 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Рейтинг данного фильма больше 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Рейтинг данного фильма больше 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Рейтинг данного фильма больше 6?",
            correctAnswer: false)
    ]
    func requestNextQuestion() {
            guard let index = (0..<questions.count).randomElement() else { return }
             let question = questions[index]
            delegate?.didReceiveNextQuestion(question: question)
        }
        
        init(delegate: QuestionFactoryDelegate?) {
            self.delegate = delegate
        }
}
