//
//  screens.swift
//  GoatAppDemoUITestsUITests
//
//  Created by Rolando Navarrete on 7/24/19.
//  Copyright © 2019 Rolando Navarrete. All rights reserved.
//

import Foundation
import XCTest
let envVars  = ProcessInfo.processInfo.environment


class BaseScreen {
  static let goatApp = XCUIApplication(bundleIdentifier: "com.airgoat.goat.ios")
}

class WelcomeScreen: BaseScreen {
  struct WelcomeScreenButtons {
    let register: XCUIElement
    let login: XCUIElement
  }

  static let welcomeScreenBtns = WelcomeScreenButtons(register: goatApp.buttons["Welcome.logIn.button"], login: goatApp.buttons["Welcome.logIn.button"])

  static func tapLoginBtn() {
    welcomeScreenBtns.login.tap()
  }
}

class LoginScreen: BaseScreen {
  struct LoginScreen {
    let usernameField: XCUIElement
    let passwordField: XCUIElement
  }

  struct Buttons {
    let login: XCUIElement
  }

  static let loginFields = LoginScreen(usernameField: goatApp.textFields["LogIn.email.field"], passwordField: goatApp.secureTextFields["LogIn.password.field"])
  static let buttons = Buttons(login:  goatApp/*@START_MENU_TOKEN@*/.buttons["LogIn.logIn.button"]/*[[".buttons[\"LOG IN\"]",".buttons[\"LogIn.logIn.button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/)

  static func tapUsernameField() {
    loginFields.usernameField.tap()
  }

  static func tapPasswordField() {
    loginFields.passwordField.tap()
  }

  static func fillPasswordField() {
    loginFields.passwordField.typeText(envVars["goatPassword"]!)
  }

  static func fillUsernameField() {
    loginFields.usernameField.typeText(envVars["goatEmail"]!)
  }

  static func tapLoginBtn() {
    buttons.login.tap()
  }

}

class UserDashboardScreen: BaseScreen {
  struct DashboardButtons {
    let home: XCUIElement
    let styles: XCUIElement
    let search: XCUIElement
    let sell: XCUIElement
    let profile: XCUIElement
  }

  static let dashboardButtons = DashboardButtons(home: goatApp.buttons["Home"], styles: goatApp.buttons["Styles"], search: goatApp.buttons["search"], sell: goatApp.buttons["Sell"], profile: goatApp.buttons["Profile"])

  static func tapProfileBtn() {
    dashboardButtons.profile.tap()
  }
}

class UserProfileScreen: BaseScreen {
  struct ProfileButtons {
    let settings: XCUIElement
    let offer: XCUIElement
    let sort: XCUIElement
    let own: XCUIElement
    let storage: XCUIElement
    let want: XCUIElement
  }

  static let profileButtons = ProfileButtons(settings: goatApp.navigationBars["DIGITAL_MAFIOSO"].buttons["SettingsIcon"], offer: goatApp.navigationBars.buttons["SettingsIcon"], sort: goatApp.navigationBars.buttons["SettingsIcon"], own: goatApp.navigationBars.buttons["SettingsIcon"], storage: goatApp.navigationBars.buttons["SettingsIcon"], want: goatApp.navigationBars.buttons["SettingsIcon"])


  static func tapSettingsBtn() {
    profileButtons.settings.tap()
  }
}

class UserSettingsScreen: BaseScreen {
  struct SettingsButtons {
    let logout: XCUIElement

  }

  static let settingsButtons = SettingsButtons(logout: goatApp.scrollViews.otherElements.otherElements["Settings.logout.view"])

  static func tapLogoutBtn() {
    settingsButtons.logout.tap()
  }
}
