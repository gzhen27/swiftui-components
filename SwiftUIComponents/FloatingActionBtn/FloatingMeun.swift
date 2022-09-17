//
//  FloatingBtnView.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 9/17/22.
//

import SwiftUI

struct FloatingMeun: View {
    @State private var isMenuOpen = false
    @State private var showCameraBtn = false
    @State private var showPhotoBtn = false
    @State private var showLivePhotoPlayBtn = false
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                menuBtn
                menuItemBar
                Spacer()
            }
            .padding()
        }
    }
    
    // MARK: - View properties
    private var menuBtn: some View {
        Button {
            withAnimation {
                isMenuOpen.toggle()
                showMenuBar()
            }
        } label: {
            Image(systemName: isMenuOpen ? "xmark.circle.fill" : "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(Color("CustomRed"))
        }
        .padding(.bottom, 2)
    }
    
    private var menuItemBar: some View {
        VStack {
            if showCameraBtn {
                MenuItem(icon: "camera")
            }
            if showPhotoBtn {
                MenuItem(icon: "photo.on.rectangle")
            }
            if showLivePhotoPlayBtn {
                MenuItem(icon: "livephoto.play")
            }
        }
    }
    
    // MARK: - Functions
    private func showMenuBar() {
        withAnimation {
            showCameraBtn.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                showPhotoBtn.toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                showLivePhotoPlayBtn.toggle()
            }
        }
    }
}

struct FloatingMeun_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMeun()
    }
}
