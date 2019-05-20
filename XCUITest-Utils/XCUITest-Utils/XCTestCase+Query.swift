//
//  XCTestCase+Query.swift
//  XCUITest-Utils
//
//  Created by Jaime Andres Laino Guerra on 5/20/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation
import XCTest

public extension XCTestCase {

    /**
     Directly query over XCUIApplication().buttons for an element that matches the predicate.
     
     ```
     //Example
     button(matching: predicate(\.label, .matches, "Close"))
     ```
    
     - Parameter predicate: predicate to fullfill.
     - Returns: the first match for the predicate.
     */
    func button(matching predicate: NSPredicate) -> XCUIElement {
        return XCUIApplication().buttons.element(matching: predicate)
    }
    
    /**
     Directly query over XCUIApplication().staticTexts for an element that matches the predicate.
     
     ```
     //Example
     staticTexts(matching: predicate(\.label, .contains, "Login"))
     ```
     
     - Parameter predicate: predicate to fullfill.
     - Returns: the first match for the predicate.
     */
    func staticText(matching predicate: NSPredicate) -> XCUIElement {
        return XCUIApplication().staticTexts.element(matching: predicate)
    }
    
    /**
     Directly query over XCUIApplication().textViews for an element that matches the predicate.
     
     ```
     //Example
     textView(matching: predicate(\.label, .matches, "PlaceHolder"))
     ```
     
     - Parameter predicate: predicate to fullfill.
     - Returns: the first match for the predicate.
     */
    func textView(matching predicate: NSPredicate) -> XCUIElement {
        return XCUIApplication().textViews.element(matching: predicate)
    }

    /**
     Directly query over XCUIApplication().otherElements for an element that matches the predicate.
     
     ```
     //Example
     otherElements(matching: predicate(\.label, .matches, "Something"))
     ```
     
     - Parameter predicate: predicate to fullfill.
     - Returns: the first match for the predicate.
     */
    func otherElements(matching predicate: NSPredicate) -> XCUIElement {
        return XCUIApplication().otherElements.element(matching: predicate)
    }
    
    /**
     Directly query over XCUIApplication().descendant(matching: type)
     for an element that matches the predicate
     
     ```
     //Example
     element(matching: predicate(\.label, .matches, "Something"))
     ```
     
     - Parameter predicate: predicate to fullfill.
     - Returns: the first match for the predicate.
     */
    func descendant(matching predicate: NSPredicate,
                    type: XCUIElement.ElementType) -> XCUIElement {
        return XCUIApplication()
            .descendants(matching: type)
            .element(matching: predicate)
    }
    
    /**
     Directly query over XCUIApplication().descendants(matching: type)
     for all elements that matches the predicate.
     
     ```
     //Example
     descendants(matching: predicate(\.label, .matches, "Something"), type: .table)
     ```
     
     - Parameter predicate: predicate to fullfill.
     - Returns: the all elements that match the predicate bound by Index.
     */
    func descendants(matching predicate: NSPredicate,
                     type: XCUIElement.ElementType) -> [XCUIElement] {
        return XCUIApplication()
            .descendants(matching: type)
            .matching(predicate)
            .allElementsBoundByIndex
    }
    
    /**
     Directly query over XCUIApplication().children(matching: type)
     for an element that matches the predicate.
     
     ```
     //Example
     children(matching: predicate(\.label, .matches, "Something"), type: .cell)
     ```
     
     - Parameter predicate: predicate to fullfill.
     - Returns: the first match for the predicate.
     */
    func children(matching predicate: NSPredicate,
                    type: XCUIElement.ElementType) -> XCUIElement {
        return XCUIApplication()
            .children(matching: type)
            .element(matching: predicate)
    }
    
    /**
     Directly query over XCUIApplication().children(matching: type)
     for all elements that matches the predicate.
     
     ```
     //Example
     childrens(matching: predicate(\.label, .matches, "Something"), type: .table)
     ```
     
     - Parameter predicate: predicate to fullfill.
     - Returns: the all elements that match the predicate bound by Index.
     */
    func childrens(matching predicate: NSPredicate,
                     type: XCUIElement.ElementType) -> [XCUIElement] {
        return XCUIApplication()
            .children(matching: type)
            .matching(predicate)
            .allElementsBoundByIndex
    }

}
