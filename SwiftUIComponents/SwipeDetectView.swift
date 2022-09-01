//
//  SwipeDetectView.swift
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
    static func get(translation: CGSize, minimuDistances: CGFloat) -> SwipeDirection {
        let maxRange: ClosedRange<CGFloat> = -minimuDistances...minimuDistances
        
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

struct SwipeDetectView: View {
    @State private var swipeDirection: SwipeDirection = .unknown
    let gestureMinimumDistance: CGFloat = 30
    
    var color: Color {
        switch swipeDirection {
        case .up:
            return Color.red.opacity(0.8)
        case .down:
            return Color.black.opacity(0.8)
        case .right:
            return Color.blue.opacity(0.8)
        case .left:
            return Color.yellow.opacity(0.8)
        case .unknown:
            return Color.gray.opacity(0.8)
        }
    }
    
    var body: some View {
        ZStack {
            color
        }
        .ignoresSafeArea()
        .gesture(
            DragGesture(minimumDistance: gestureMinimumDistance, coordinateSpace: .local)
                .onEnded({ gesture in
                    swipeDirection = SwipeDirection.get(translation: gesture.translation, minimuDistances: gestureMinimumDistance)
                })
        )
    }
}

struct SwipeDetectView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetectView()
    }
}
