//
//  GoatAppDemoUITestsUITests.swift
//  GoatAppDemoUITestsUITests
//
//  Created by Rolando Navarrete on 7/23/19.
//  Copyright © 2019 Rolando Navarrete. All rights reserved.
//

import XCTest

class GoatAppDemoUITestsUITests: XCTestCase {
  let envVars  = ProcessInfo.processInfo.environment
  let goatApp = XCUIApplication(bundleIdentifier: "com.airgoat.goat.ios")

    override func setUp() {
        continueAfterFailure = false
        goatApp.launch()
    }

    override func tearDown() {
      // log user out of the app
      UserDashboardScreen.tapProfileBtn()
      UserProfileScreen.tapSettingsBtn()
      UserSettingsScreen.tapLogoutBtn()
      goatApp.terminate()
    }

    func testLogin() {
      WelcomeScreen.tapLoginBtn()
      LoginScreen.fillUsernameField()
      LoginScreen.tapPasswordField()
      LoginScreen.fillPasswordField()
      LoginScreen.tapLoginBtn()
      XCTAssert(goatApp.buttons["Profile"].exists)
    }
}
