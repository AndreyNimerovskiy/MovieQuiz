//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Mac on 10.12.2024.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let buttonAction: (() -> Void)?
}
