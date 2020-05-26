//
//  UITests.swift
//  UITests
//
//  Created by Vladislav Zinger on 26.05.2020.
//  Copyright © 2020 Vladislav Zinger. All rights reserved.
//

import XCTest

class UITests: XCTestCase {

    let app = XCUIApplication(bundleIdentifier: "github.action.demo.GithubActionDemo")
    
    override func tearDown() {
        XCTContext.runActivity(named: "Attach screenshot to end of report") { activity in
            activity.add(takeFullScreenshot())
        }
        app.terminate()
    }

    
    func test_create_new_note() throws {
        runApp(app)
        app.navigationBars["Master"].buttons["plus"].firstMatch.tap()
        wait(app.navigationBars["Master"])
    }

}
