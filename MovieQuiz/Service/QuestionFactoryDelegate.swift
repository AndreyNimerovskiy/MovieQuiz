//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Mac on 10.12.2024.
//

import Foundation


protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
