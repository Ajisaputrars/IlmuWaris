//
//  FinalProjectUITests.swift
//  FinalProjectUITests
//
//  Created by Aji Saputra Raka Siwi on 1/25/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import XCTest

class FinalProjectUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testOpenApp(){
        
    }
    
    func testOpenWarisMenu(){
        
        let app = XCUIApplication()
        app.otherElements.containing(.navigationBar, identifier:"Aplikasi").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0).children(matching: .button).element.tap()
        
        let lanjutButton = app.buttons["Lanjut"]
        lanjutButton.tap()
        
        let textField = app.otherElements.containing(.navigationBar, identifier:"FinalProject.HartaView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("1000000")
        
        let toolbarDoneButtonButton = app.toolbars.buttons["Toolbar Done Button"]
        toolbarDoneButtonButton.tap()
        lanjutButton.tap()
        app.otherElements.containing(.navigationBar, identifier:"FinalProject.GenderView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
        lanjutButton.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"FinalProject.IstriView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 2).tap()
        element.children(matching: .other).element(boundBy: 1).tap()
        lanjutButton.tap()
        lanjutButton.tap()
        lanjutButton.tap()
        
        let textField2 = app.otherElements.containing(.navigationBar, identifier:"FinalProject.SaudaraKandungView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("1")
        toolbarDoneButtonButton.tap()
        lanjutButton.tap()
        
        let textField3 = app.otherElements.containing(.navigationBar, identifier:"FinalProject.SaudaraSeayahView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1)
        textField3.tap()
        textField3.typeText("1")
        toolbarDoneButtonButton.tap()
        lanjutButton.tap()
        
        let element2 = app.otherElements.containing(.navigationBar, identifier:"FinalProject.SaudaraSeibuView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField4 = element2.children(matching: .textField).element(boundBy: 1)
        textField4.tap()
        textField4.typeText("2")
        
        let textField5 = element2.children(matching: .textField).element(boundBy: 0)
        textField5.tap()
        textField5.typeText("3")
        toolbarDoneButtonButton.tap()
        lanjutButton.tap()
        
        let textField6 = app.otherElements.containing(.navigationBar, identifier:"FinalProject.AnakSaudaraView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 0)
        textField6.tap()
        textField6.typeText("1")
        toolbarDoneButtonButton.tap()
        lanjutButton.tap()
        lanjutButton.tap()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
