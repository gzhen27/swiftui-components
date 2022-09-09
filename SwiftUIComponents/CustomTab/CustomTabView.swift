//
//  CustomTabView.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 9/8/22.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var tabViewNavigator = TabViewNavigator()
    @State private var isPresentedAddView = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    switch tabViewNavigator.selectedTab {
                    case .current:
                        Text("Current")
                    case .history:
                        Text("History")
                    case .calculator:
                        Text("Calculator")
                    case .user:
                        Text("Account")
                    }
                    Spacer()
                    HStack {
                        CustomTabViewItem(tabViewNavigator: tabViewNavigator, tabIdentifer: .current, tabItemName: "Current", imageName: "calendar", size: geo.size)
                        CustomTabViewItem(tabViewNavigator: tabViewNavigator, tabIdentifer: .history, tabItemName: "History", imageName: "chart.bar", size: geo.size)
                        AddItemButton(isPresentedAddView: $isPresentedAddView, imageName: "plus.circle.fill", size: geo.size)
                        CustomTabViewItem(tabViewNavigator: tabViewNavigator, tabIdentifer: .calculator, tabItemName: "Calc", imageName: "plusminus", size: geo.size)
                        CustomTabViewItem(tabViewNavigator: tabViewNavigator, tabIdentifer: .user, tabItemName: "Account", imageName: "person.circle", size: geo.size)
                    }
                    .frame(width: geo.size.width, height: geo.size.height/10)
                    .background(Color("TabBarBackground"))
                    .shadow(radius: 2)
                }
                if $isPresentedAddView.wrappedValue {
                    AddItemView(isPresentedAddView: $isPresentedAddView, size: geo.size)
                }
            }
        }
    }
}

struct AddItemButton: View {
    @Binding var isPresentedAddView: Bool
    let imageName: String
    let size: CGSize
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: size.width/7, height: size.height/7)
                .shadow(radius: 4)
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width/7-10, height: size.height/7-10)
                .foregroundColor(Color("CustomRed"))
        }
        .offset(y: -size.height/20)
        .onTapGesture {
            isPresentedAddView.toggle()
        }
    }
}

struct CustomTabViewItem: View {
    @ObservedObject var tabViewNavigator: TabViewNavigator
    let tabIdentifer: TabViewNavigator.CustomTab
    let tabItemName: String
    let imageName: String
    let size: CGSize
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width/5, height: size.height/28)
                .padding(.top, 10)
            Text(tabItemName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            tabViewNavigator.selectedTab = tabIdentifer
        }
        .foregroundColor(tabViewNavigator.selectedTab == tabIdentifer ? Color("CustomRed") : Color("TabBarColor"))
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomTabView()
                .previewDevice("iPhone 13")
            CustomTabView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 8")
            CustomTabView()
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
    }
}
