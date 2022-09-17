//
//  MenuItem.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 9/17/22.
//

import SwiftUI

struct MenuItem: View {
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("CustomRed"))
                .frame(width: 35, height: 35)
            Image(systemName: icon)
                .imageScale(.medium)
                .foregroundColor(.white)
        }
        .transition(.move(edge: .trailing))
    }
}
