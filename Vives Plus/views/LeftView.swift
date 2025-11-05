//
//  leftView.swift
//  Vives Plus
//
//  Created by Florian Degraeve on 04/11/2025.
//

import SwiftUI

struct LeftView: View {
    @State var  picked : EventModel?
    @Environment(UurroosterDataStore.self) private var dataStore
    @State var loading = true
    
    var body: some View {
        VStack{
            if loading { ProgressView("Loading...")
            } else {
                List(
                    dataStore.uurrooster! ,id: \.self, selection: $picked) { i in
                        VStack{
                            Text(DateUtil.formatDateTime(date :i.startDateTime))
                            NavigationLink(i.title) {
                                DetailView(picked: i)}
                        }
                    }
            }
        }.task {
            await dataStore.loadData()
            loading = false
        }.toolbar {
            NavigationLink(destination: AddEventView()) {
                Image(systemName: "plus")
            }
        }
    }
}
