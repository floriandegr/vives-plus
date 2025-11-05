//
//  SplitView.swift
//  Vives Plus
//
//  Created by Florian Degraeve on 04/11/2025.
//

import SwiftUI

struct SplitView: View {
    @State var  picked : EventModel?
    
    var body: some View {
        NavigationSplitView {
            LeftView(picked: picked)
        } detail: {
            DetailView(picked: picked)
        }
    }
}

