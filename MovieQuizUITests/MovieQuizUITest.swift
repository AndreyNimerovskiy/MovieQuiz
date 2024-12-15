//
//  MovieQuizUITest.swift
//  MovieQuizUITest
//
//  Created by Mac on 11.12.2024.
//

import XCTest

final class MovieQuizUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
            
            app.terminate()
            app = nil
    }
    func testYesButton()  {
            sleep (2)
            let firstPoster = app.images["Poster"]
            let firstPosterData = firstPoster.screenshot().pngRepresentation
            
            sleep(2)
            app.buttons["Yes"].tap()
        
            sleep (2)
            let secondPoster = app.images["Poster"]
            let secondPosterData = secondPoster.screenshot().pngRepresentation
            
            XCTAssertNotEqual(firstPosterData, secondPosterData)
        }
    func testNoButton()  {
            sleep (2)
            let firstPoster = app.images["Poster"]
            let firstPosterData = firstPoster.screenshot().pngRepresentation
            
            sleep(2)
            app.buttons["No"].tap()
            
            sleep(2)
            let secondPoster = app.images["Poster"]
            let secondPosterData = secondPoster.screenshot().pngRepresentation
            
            sleep(2)
            let indexLabel = app.staticTexts["Index"]
            
            sleep(2)
            XCTAssertNotEqual(firstPosterData, secondPosterData)
            XCTAssertEqual(indexLabel.label, "2/10")
        }
    
    func testShowAlert () {
            
            sleep (2)
            for _ in 1...10 {
                app.buttons ["Yes"].tap ()
                sleep (3)
            }
            
            sleep(3)
            let alert = app.alerts["Alert"]
            
            sleep(2)
            XCTAssertTrue(alert.exists)
            XCTAssertTrue(alert.label == "Этот раунд окончен!")
            XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть ещё раз")
        }
    
    
    func testAlertNotShow() {
            sleep(2)
            for _ in 1...10 {
                app.buttons["No"].tap()
                sleep(2)
            }
            
            sleep (2)
            let alert = app.alerts["Alert"]
            alert.buttons.firstMatch.tap()
            
            sleep(2)
            let indexLabel = app.staticTexts["Index"]
            
            sleep(2)
            XCTAssertFalse(alert.exists)
            XCTAssertTrue(indexLabel.label == "1/10")
        }
}