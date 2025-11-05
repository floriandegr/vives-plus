//
//  UurroosterDataStore.swift
//  Uurrooster
//
//  Created by Dirk Hostens on 14/10/2022.
//

import Foundation

@Observable
class UurroosterDataStore {
    var uurrooster : [EventModel]?
    
    init() {
        
    }
    
    private func sort(){
        
    }
    
    func addEvent(event: EventModel ){
        uurrooster?.append(event)
    }
    func addEvent(title : String, location : String){
        
    }
    
    func updateEvent(event: EventModel ){
        for model in uurrooster!{
            if(model.id == event.id)
            {
                model.type = event.type
                model.allDay = event.allDay
                model.endDateTime = event.endDateTime
                model.location = event.location
                model.startDateTime = event.startDateTime
                model.title = event.title
            }
        }
    }
    
    func deleteEvent(id: String) {
        var i = 0
        var index :  Int?
        for model in uurrooster!{
            if( model.id == id)
            {
                index = i
            }
            i+=1
        }
        uurrooster?.remove(at: index!)
    }
    
    func getEvent(id: String) -> EventModel {
        return uurrooster!.filter { i in
            i.id == id
        }[0]
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            let data: [EventModelJson] = try load("uurrooster.json")
            //Hier komt mapping naar array van EventModel -> uurrooster
            uurrooster = data.map({ i in
                i.toEventModel()
            })
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            uurrooster = [EventModel]()
        }
    }

}

private struct EventModelJson: Hashable, Codable, Identifiable {
    var id:String = ""
    var allDay: Bool = false
    var title: String = ""
    var location: String? = nil
    var type: String = ""
    var startDateTime: String = ""
    var endDateTime: String = ""
    
    var formattedStartDateTime: String {
        get {
            return startDateTime.replacingOccurrences(of: "T", with: " ")
        }
    }
    var formattedEndDateTime: String {
        get {
            return endDateTime.replacingOccurrences(of: "T", with: " ")
        }
    }
    var formattedAllDayStartTime: String {
        get {
            return String(startDateTime.split(separator: "T")[0])
        }
    }
    func getEventInput() -> (title: String, location: String, allDay: Bool, startDate: Date, endDate: Date, type: Int ) {
        return (self.title, self.location == nil ? "" : location!, allDay, DateUtil.getDate(string: startDateTime), DateUtil.getDate(string: endDateTime), type.elementsEqual("academic") ? 0 : 1)
    }
    
    func toEventModel() -> EventModel {
        let eventModel = EventModel()
        eventModel.id = self.id
        eventModel.allDay = self.allDay
        eventModel.title = self.title
        eventModel.location = self.location ?? ""
        eventModel.startDateTime = DateUtil.getDate(string: self.startDateTime)
        eventModel.endDateTime = DateUtil.getDate(string: self.endDateTime)
        if self.type.elementsEqual("academic") {
            eventModel.type = 0
        } else {
            eventModel.type = 1
        }
        return eventModel
    }
}
