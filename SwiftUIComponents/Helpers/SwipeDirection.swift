//
//  SwipeDirection.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 9/1/22.
//

import SwiftUI

enum SwipeDirection {
    case up
    case down
    case right
    case left
    case unknown
    
    /**
     get the swipe direction based on the gesture.translation
     */
    static func get(translation: CGSize, minimumDistance: CGFloat) -> SwipeDirection {
        let maxRange: ClosedRange<CGFloat> = -minimumDistance...minimumDistance
        
        switch (translation.width, translation.height) {
        case (...0, maxRange):
            return .left
        case (0..., maxRange):
            return .right
        case (maxRange, ...0):
            return .up
        case (maxRange, 0...):
            return .down
        default:
            return .unknown
        }
    }
}
