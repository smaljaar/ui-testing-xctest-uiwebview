//
//  HybridHelloWorldUITests.swift
//  HybridHelloWorldUITests
//
//  Created by Samuël Maljaars on 20/05/16.
//  Copyright © 2016 smaljaars. All rights reserved.
//

import XCTest

class HybridHelloWorldUITests: XCTestCase {
        
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
    
    func testHybrid() {
        
        let app = XCUIApplication()

        waitForElementToAppear(app.otherElements["Search"], andDo: {
            app.otherElements["Search"].tap()
            app.otherElements["hello adele ×"].tap()
            app.staticTexts["Clear Search"].tap()
            app.otherElements["Search"].tap()
            app.toolbars.buttons["Done"].tap()
            
        })
        
        app.buttons["Native button"].tap()
        
        app.buttons["Dismiss"].tap()

    }
    
    func testagain(){
        
        let app = XCUIApplication()
        app.otherElements["Search"].tap()
        NSThread.sleepForTimeInterval(1)

        app.typeText("fsaa")
        app.buttons["Search"].tap()
        app.typeText("\n")
        
    }
    
    func testTextEntryNativeTextfield(){
        let app = XCUIApplication()
        let textfieldTextField = app.textFields["textfield"]
        textfieldTextField.tap()
        textfieldTextField.typeText("samuel")
        
    }
    
    
    private func waitForElementToAppear(element: XCUIElement,
                                        file: String = #file, line: UInt = #line, andDo: () -> ()) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectationForPredicate(existsPredicate,
                                evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 5 seconds."
                self.recordFailureWithDescription(message,
                                                  inFile: file, atLine: line, expected: true)
            }
            andDo()
        }
    }
}
