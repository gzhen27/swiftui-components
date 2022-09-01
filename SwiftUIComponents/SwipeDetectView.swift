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
}

struct SwipeDetectView: View {
    let maxDiffDistance: CGFloat = 20.0
    
    @State private var color = Color.gray.opacity(0.8)
    @State private var swipeDirection : SwipeDirection = .unknown
    @State private var startPoint: CGPoint?
    
    var body: some View {
        ZStack {
            color
        }
        .ignoresSafeArea()
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    setStartPoint(location: gesture.location)
                })
                .onEnded({ gesture in
                    detectDirection(endPoint: gesture.location)
                })
        )
    }
    
    private func setStartPoint(location: CGPoint) {
        if self.startPoint == nil {
            self.startPoint = location
        }
    }
    
    private func detectDirection(endPoint: CGPoint) {
        guard let startPoint = self.startPoint else {
            return
        }

        let xDistance = abs(endPoint.x - startPoint.x)
        let yDistance = abs(endPoint.y - startPoint.y)
        
        switch (xDistance, yDistance) {
        case let(x,y) where y > x && startPoint.y > endPoint.y:
            self.swipeDirection = .up
            self.color = Color.red.opacity(0.8)
            print("swipe up")
        case let(x,y) where y > x && startPoint.y < endPoint.y:
            self.swipeDirection = .down
            self.color = Color.black.opacity(0.8)
            print("swipe down")
        case let(x,y) where y < x && startPoint.x < endPoint.x:
            self.swipeDirection = .right
            self.color = Color.yellow.opacity(0.8)
            print("swipe right")
        case let(x,y) where y < x && startPoint.x > endPoint.x:
            self.swipeDirection = .left
            self.color = Color.blue.opacity(0.8)
            print("swipe left")
        default:
            self.swipeDirection = .unknown
        }
    }
}

struct SwipeDetectView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetectView()
    }
}
