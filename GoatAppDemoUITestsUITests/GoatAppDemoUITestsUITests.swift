//
//  GoatAppDemoUITestsUITests.swift
//  GoatAppDemoUITestsUITests
//
//  Created by Rolando Navarrete on 7/23/19.
//  Copyright © 2019 Rolando Navarrete. All rights reserved.
//

import XCTest

class GoatAppDemoUITestsUITests: XCTestCase {
  let goatApp = XCUIApplication(bundleIdentifier: "com.airgoat.goat.ios")

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        goatApp.launch()
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
      // we want to sign the user out of the app, if they are logged in
      goatApp.buttons["Profile"].tap()
      goatApp.navigationBars["DIGITAL_MAFIOSO"].buttons["SettingsIcon"].tap()

      let elementsQuery = goatApp.scrollViews.otherElements
      elementsQuery.otherElements["Settings.logout.view"].tap()
      XCTAssertFalse(goatApp.buttons["Settions.logou.view"].exists)
    }

    func testLogin() {
      // tap the welcome button on the logged out homepage
      goatApp/*@START_MENU_TOKEN@*/.buttons["Welcome.logIn.button"]/*[[".buttons[\"LOG IN\"]",".buttons[\"Welcome.logIn.button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      // store the email text field to a variable
      let usernameField = goatApp/*@START_MENU_TOKEN@*/.textFields["LogIn.email.field"]/*[[".textFields[\"Username or Email\"]",".textFields[\"LogIn.email.field\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      // type the email into the email field
      usernameField.typeText("kinglouis.belmont@gmail.com")
      // store the password field into a variable
      let passwordField = goatApp/*@START_MENU_TOKEN@*/.secureTextFields["LogIn.password.field"]/*[[".secureTextFields[\"Password\"]",".secureTextFields[\"LogIn.password.field\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      passwordField.tap()
      // type the password into the password field
      passwordField.typeText("Godfather100!!")
      // click on the login/submit button
      goatApp/*@START_MENU_TOKEN@*/.buttons["LogIn.logIn.button"]/*[[".buttons[\"LOG IN\"]",".buttons[\"LogIn.logIn.button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      // assert that after logging in, we no longer see the email field
    }
}
