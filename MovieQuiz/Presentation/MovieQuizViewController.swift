//
//  ViewController.swift
//  MovieQuiz
//
//  Created by Mac on 28.08.2024.
//

import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
    
    
        private var alertPresenter: AlertPresenter?
        private var statisticService: StatisticServiceProtocol?
        private var presenter: MovieQuizPresenter!
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
    
    @IBOutlet private weak var noButton: UIButton!
    @IBOutlet private weak var yesButton: UIButton!
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            imageView.layer.cornerRadius = 20
            
            alertPresenter = AlertPresenter()
            statisticService = StatisticService()
            activityIndicator.hidesWhenStopped = true
            presenter = MovieQuizPresenter(viewController: self)
        }
    
    func show(quizStep step: QuizStepViewModel) {
            imageView.image = step.image
            textLabel.text = step.question
            counterLabel.text = step.questionNumber
            imageView.layer.borderWidth = 0
            setButtonsEnabled(true)
        }
    
    func showQuizResult(_ result: QuizResultsViewModel) {
           let message = presenter.makeResultsMessage()
           
           let alert = UIAlertController(
               title: result.title,
               message: message,
               preferredStyle: .alert)
           alert.view.accessibilityIdentifier = "Alert"
           
           let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
               guard let self = self else { return }
               
               self.presenter.resetQuiz()
           }
           
           alert.addAction(action)
           
           self.present(alert, animated: true, completion: nil)
       }
    
    func showLoadingIndicator() {
            activityIndicator.startAnimating()
        }
        
        func hideLoadingIndicator() {
            activityIndicator.stopAnimating()
        }
        
        func showNetworkError(message: String) {
            hideLoadingIndicator()
            
            let model = AlertModel(title: "Ошибка",
                                   message: message,
                                   buttonText: "Попробовать еще раз") { [weak self] in
                guard let self = self else { return }
                
                
                self.presenter.resetQuiz()
            }
            
            alertPresenter?.showAlert(on: self, with: model)
        }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 8
            imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        }
        
        func setButtonsEnabled(_ isEnabled: Bool) {
            yesButton.isEnabled = isEnabled
            noButton.isEnabled = isEnabled
        }
    
    //Ibac action button
    
    @IBAction private func noButton(_ sender: UIButton) {
        setButtonsEnabled(false)
        presenter.yesButtonClicked()
    }
    
    @IBAction private func yesButton(_ sender: UIButton) {
        setButtonsEnabled(false)
        presenter.noButtonClicked()
    }
    
}
