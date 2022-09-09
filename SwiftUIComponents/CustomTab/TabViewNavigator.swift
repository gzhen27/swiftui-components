//
//  TabViewNavigator.swift
//  SwiftUIComponents
//
//  Created by G Zhen on 9/8/22.
//

import SwiftUI

class TabViewNavigator: ObservableObject {
    @Published var selectedTab: CustomTab = .current
    
    enum CustomTab {
        case current
        case history
        case calculator
        case user
    }
}
