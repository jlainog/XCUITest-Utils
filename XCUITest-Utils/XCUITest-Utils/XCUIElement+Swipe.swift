//
//  XCUIElement+Swipe.swift
//  XCUITest-Utils
//
//  Created by Jaime Andres Laino Guerra on 5/20/19.
//  Copyright © 2019 Jaime Andres Laino Guerra. All rights reserved.
//

import Foundation
import XCTest

public extension XCUIElement {
    enum SwipeDirection {
        case up
        case down
        case left
        case right
    }

    /**
     Swipes the screen using the provided points.
     
     - Parameter startVector: Relative point from which to start swipe.
     - Parameter stopVector: Relative point to end swipe.
     
     The Vector needs to be Normalized to correctly pass to *coordinate(withNormalizedOffset:)*
     */
    func swipe(from startVector: CGVector, to stopVector: CGVector) {
        let start = coordinate(withNormalizedOffset: startVector)
        let finish = coordinate(withNormalizedOffset: stopVector)
        start.press(forDuration: 0.05, thenDragTo: finish)
    }
    
    /**
     Swipes the screen given a direction until the condition is satisfy or it exceed the number of swipes.
     
     - Parameter direction: direction of swipe.
     - Parameter maxSwipes: max number of swipes.
     - Parameter condition: The condition to satisfy.
     */
    func swipe(_ direction: SwipeDirection,
               maxSwipes: Int = 10,
               until condition: @autoclosure () -> Bool) {
        var swipes = maxSwipes
        
        while (!condition() && swipes != 0) {
            let (startVector, stopVector) = swipeVectors(for: direction)
            
            swipe(from: startVector, to: stopVector)
            swipes -= 1
        }
    }
    
    /**
     Returns the Start and Stop vectors normalized given a direction.
     
     - Parameter direction: direction of swipe.
     - Returns: Returns a Tuple with the Start and Stop vectors normalized.
     */
    func swipeVectors(for direction: SwipeDirection) -> (startVector: CGVector, stopVector: CGVector) {
        let centerPoint = center()
        let directionVector = vector(for: direction)
        let startVector = CGVector(dx: centerPoint.x + directionVector.dx / 2,
                                   dy: centerPoint.y + directionVector.dy / 2)
        let stopVector = CGVector(dx: centerPoint.x - directionVector.dx / 2,
                                  dy: centerPoint.y - directionVector.dy / 2)
        
        return (startVector, stopVector)
    }
    
    /// return the center point *Normalized*
    private func center() -> CGPoint {
        return CGPoint(x: frame.midX / frame.width,
                       y: frame.midY / frame.height)
    }
    
    /// Vector for a given direction *Normalized*
    private func vector(for direction: SwipeDirection) -> CGVector {
        var dx: CGFloat = 0
        var dy: CGFloat = 0
        let percentOfMovement: CGFloat = 0.2
        let maxOffset = CGSize(width: frame.width * percentOfMovement,
                               height: frame.height * percentOfMovement)
        
        switch direction {
        case .up: dy = -maxOffset.height
        case .down: dy = maxOffset.height
        case .left: dx = -maxOffset.width
        case .right: dx = maxOffset.width
        }
        
        return CGVector(dx: dx / frame.width,
                        dy: dy / frame.height)
    }
    
}
