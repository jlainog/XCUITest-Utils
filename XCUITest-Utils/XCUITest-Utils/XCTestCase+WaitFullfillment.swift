//
//  XCTestCase+WaitFullfillment.swift
//  XCUITest-Utils
//
//  Created by Jaime Andres Laino Guerra on 5/20/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation
import XCTest

public extension XCTestCase {

    /**
     Waits until satisfy the predicate or timed out.

     - Parameter predicate: Predicate to Satisfy.
     - Parameter element: XCUIElement to Watch.
     - Parameter timeout: Time to wait for predicate to be satisfied.
     - Parameter message: Message to display if timed out.
     - Parameter file: file where assert happens.
     - Parameter line: line where assert happens.

     - Assert: assert if the predicated timed out.
     */
    func wait(fullfillment predicate: NSPredicate,
              for element: XCUIElement,
              timeout: TimeInterval = 5,
              message: String? = nil,
              file: StaticString = #file,
              line: UInt = #line) {
        let waitExpectation = expectation(for: predicate,
                                          evaluatedWith: element,
                                          handler: nil)
        
        let result = XCTWaiter.wait(for: [waitExpectation], timeout: timeout)

        switch result {
        case .completed: break
        default:
            if let message = message {
                XCTFail(message, file: file, line: line)
            }

            XCTFail("Failed to fullfill predicate: \(predicate)", file: file, line: line)
        }
    }
    
    /**
     Waits until element exist or timed out.
     
     - Parameter element: XCUIElement to Watch.
     - Parameter timeout: Time to wait for predicate to be satisfied.
     - Parameter message: Message to display if timed out.
     - Parameter file: file where assert happens.
     - Parameter line: line where assert happens.
     
     - Assert: assert if timed out.
     */
    func wait(forExistance element: XCUIElement,
              timeout: TimeInterval = 5,
              message: String? = nil,
              file: StaticString = #file,
              line: UInt = #line) {
        let existPredicate = predicate(\.exists, .equalTo, true)
        wait(fullfillment: existPredicate, for: element, timeout: timeout, file: file, line: line)
    }

    /**
     Waits until element cease to exist or timed out.
     
     - Parameter element: XCUIElement to Watch.
     - Parameter timeout: Time to wait for predicate to be satisfied.
     - Parameter message: Message to display if timed out.
     - Parameter file: file where assert happens.
     - Parameter line: line where assert happens.
     
     - Assert: assert if timed out or element don't exist when called.
     */
    func wait(forDissappear element: XCUIElement,
              timeout: TimeInterval = 5,
              message: String? = nil,
              file: StaticString = #file,
              line: UInt = #line) {
        if !element.exists {
            XCTFail("Element should exist before wait for it to dissappear", file: file, line: line)
        }
        
        let existPredicate = predicate(\.exists, .equalTo, false)
        wait(fullfillment: existPredicate, for: element, timeout: timeout, file: file, line: line)
    }
}
