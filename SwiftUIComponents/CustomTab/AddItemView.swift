//
//  AddItemView.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 9/8/22.
//

import SwiftUI

struct AddItemView: View {
    @Binding var isPresentedAddView: Bool
    let size: CGSize
    
    var body: some View {
        ZStack {
            Color.white
            Color.black.opacity(0.4)
            VStack {
                Text("Add")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("CustomRed"))
                Spacer()
                Button {
                    self.isPresentedAddView.toggle()
                } label: {
                    Text("Close")
                        .padding()
                        .foregroundColor(Color("CustomRed"))
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("CustomRed"), lineWidth: 3)
                                .frame(width: size.width*0.6, height: 32)
                        )
                }
                .padding()
                
            }
            .frame(width: size.width*0.9, height: size.height*0.9)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 16)
        }
        .ignoresSafeArea()
    }
}
