//
//  DetailView.swift
//  Vives Plus
//
//  Created by Florian Degraeve on 04/11/2025.
//

import SwiftUI

struct DetailView: View {
    @Environment(UurroosterDataStore.self) private var dataStore
    var  picked : EventModel?
    
    var body: some View {
        VStack{
            if picked == nil
            {
                Text("choose an event")
            }
            else {
                VStack{
                    Text(picked!.title)
                    if picked!.type == 0
                    {
                        Text("Academic")
                    }
                    else
                    {
                        Text("Event")
                    }
                    
                }.toolbar {
                    NavigationLink(destination: UpdateView(eventModel: picked!)) {
                        Image(systemName: "ellipsis")}}
                
            }
        }
    }
}
