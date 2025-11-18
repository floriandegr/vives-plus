//
//  AddEventView.swift
//  Vives Plus
//
//  Created by Florian Degraeve on 05/11/2025.
//

import SwiftUI

struct AddEventView: View {
    
    @State var eventModel : EventModel = EventModel()
    @Environment(UurroosterDataStore.self) private var dataStore
    var body: some View {
        VStack{
            Text("Add Event")
            HStack{
                Text("Title")
                TextEditor(text: $eventModel.title)
            }
            HStack{
                Text("Location")
                TextEditor(text: $eventModel.location)
            }
            Toggle("All day?", isOn: $eventModel.allDay)
            Text("Start Date and time")
            DatePicker("", selection: $eventModel.startDateTime)
            Text("end Date and time")
            DatePicker("", selection: $eventModel.endDateTime)
            HStack{
                Text("Type")
                Picker(selection: $eventModel.type, label: Text("Type")) {
                                            Text("Academic").tag(0)
                                            Text("Course").tag(1)
                                        }.pickerStyle(SegmentedPickerStyle()).padding(.all , 4)
                //Toggle("", isOn: $eventModel.type ).toggleStyle(.switch)
            }
            HStack{
                Button("apply") {
                    
                    dataStore.addEvent(event :eventModel)
                }
            }
        }
    }
}

