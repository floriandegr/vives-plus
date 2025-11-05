//
//  Vives_PlusApp.swift
//  Vives Plus
//
//  Created by Florian Degraeve on 04/11/2025.
//

import SwiftUI

@main
struct Vives_PlusApp: App {
    @State var dataStore = UurroosterDataStore()
    

    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataStore)
        }
    }
}
