//
//  AddEventView.swift
//  Vives Plus
//
//  Created by Florian Degraeve on 05/11/2025.
//

import SwiftUI

struct AddEventView: View {
    @State var titel : String = ""
    @State var location : String = ""
    @State var allDay : Bool = false
    @State var startdate : Date = Date.now
    @State var enddate : Date  = Date.now
    @State var type : Bool = true
    @Environment(UurroosterDataStore.self) private var dataStore
    var body: some View {
        VStack{
            Text("Add Event")
            HStack{
                Text("Title")
                TextEditor(text: $titel)
            }
            HStack{
                Text("Location")
                TextEditor(text: $location)
            }
            Toggle("All day?", isOn: $allDay)
            Text("Start Date and time")
            DatePicker("", selection: $startdate)
            Text("end Date and time")
            DatePicker("", selection: $enddate)
            HStack{
                Text("Type")
                Toggle("", isOn: $type ).toggleStyle(.switch)
            }
            HStack{
                Button("apply") {
                    dataStore.addEvent(event: EventModel())
                }
            }
        }
    }
}

