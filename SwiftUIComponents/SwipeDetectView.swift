//
//  SwipeDetectView.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 9/1/22.
//

import SwiftUI

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
                    swipeDirection = SwipeDirection.get(translation: gesture.translation, minimumDistance: gestureMinimumDistance)
                })
        )
    }
}

struct SwipeDetectView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDetectView()
    }
}
