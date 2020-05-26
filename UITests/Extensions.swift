//
//  Extensions.swift
//  UITests
//
//  Created by Vladislav Zinger on 26.05.2020.
//  Copyright © 2020 Vladislav Zinger. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    // Wait element for first match
    func wait(_ element: XCUIElement, _ timeout: TimeInterval = 5) {
        let myPredicate = NSPredicate(format: "exists == true")
        let myExpectation = expectation(for: myPredicate, evaluatedWith: element, handler: nil)

        let result = XCTWaiter().wait(for: [myExpectation], timeout: timeout)
        XCTAssert(element.firstMatch.exists)
        print(result)
    }

    // Wait element from all element's tree
    func waitAll(_ element: XCUIElement, _ timeout: TimeInterval = 5) {
        let myPredicate = NSPredicate(format: "exists == true")
        let myExpectation = expectation(for: myPredicate, evaluatedWith: element, handler: nil)

        let result = XCTWaiter().wait(for: [myExpectation], timeout: timeout)
        XCTAssert(element.exists)
        print(result)
    }

    // Take screenshot of some UI element
    func takeScreenshot(_ element: XCUIElement) -> XCTAttachment {
        let attachment = XCTAttachment(screenshot: element.screenshot())
        attachment.lifetime = .keepAlways
        return attachment
    }

    // Take screenshot of all screen
    func takeFullScreenshot() -> XCTAttachment {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.lifetime = .keepAlways
        return attachment
    }

    // Launch app
    @discardableResult func runApp(_ app: XCUIApplication, _ argumentsParameters: [String] = [], _ environmentParameters: [String: String] = [:]) -> XCUIApplication {
        XCTContext.runActivity(named: "Run app on \(UIDevice.current.name) - \(UIDevice.current.systemVersion)") { activity in

            app.launchArguments += argumentsParameters

            for (key, value) in environmentParameters {
                app.launchEnvironment[key] = value
            }
            XCTContext.runActivity(named: "Env: \(app.launchEnvironment)") { _ in }
            XCTContext.runActivity(named: "Arguments: \(app.launchArguments)") { _ in }
            continueAfterFailure = false
            app.launch()
            activity.add(takeFullScreenshot())
        }
        return app
    }
}
