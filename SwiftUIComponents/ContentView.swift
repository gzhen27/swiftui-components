//
//  ContentView.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            SwipeDetectView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
