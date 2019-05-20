//
//  Functions.swift
//  XCUITest-Utils
//
//  Created by Jaime Andres Laino Guerra on 5/20/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation
import XCTest

/**
 Creates a NSPredicate given a KeyPath an operator and a constant value.
 
 - Parameter kp: keyPath from XCUIElement to compare.
 - Parameter type: Comparison operator to use.
 - Parameter value: Constant value to compare with.
 - Returns: NSPredicate.
 */
public func predicate<T>(_ kp: KeyPath<XCUIElement, T>,
                         _ type: NSComparisonPredicate.Operator,
                         _ value: Any) -> NSPredicate {
    let lhs = NSExpression(forKeyPath: kp)
    let rhs = NSExpression(forConstantValue: value)
    return NSComparisonPredicate(leftExpression: lhs,
                                 rightExpression: rhs,
                                 modifier: .direct,
                                 type: type)
}

/**
 Creates a NSPredicate given 2 predicates and a logical type.
 
 - Parameter lhs: left predicate.
 - Parameter type: logical operator to use.
 - Parameter rhs: right predicate.
 - Returns: NSPredicate.
 */
public func compound(_ lhs: NSPredicate,
                     _ type: NSCompoundPredicate.LogicalType,
                     _ rhs: NSPredicate) -> NSPredicate {
    return NSCompoundPredicate(type: type, subpredicates: [lhs, rhs])
}
