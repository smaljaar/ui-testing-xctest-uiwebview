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
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTextEntryInGoogleInWebview(){
        
        let app = XCUIApplication()
        app.otherElements["Search"].tap()
        
        //Fails with message:
        //UI Testing Failure - Neither element nor any descendant has keyboard focus.
        
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
}
