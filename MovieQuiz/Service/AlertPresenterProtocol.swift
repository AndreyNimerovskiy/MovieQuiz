//
//  AlertPresenterProtocol.swift
//  MovieQuiz
//
//  Created by Mac on 10.12.2024.
//

import UIKit

protocol AlertPresenterProtocol: AnyObject {
    var delegate: AlertPresenterDelegate? { get set }
        func show(alertModel: AlertModel)
}
