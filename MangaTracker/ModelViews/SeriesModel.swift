//
//  SeriesModel.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import Foundation
import Firebase

class SeriesModel: ObservableObject {
    
    // Firebase properties
    let db = Firestore.firestore()
    let userId = "dlz"
    
    // Observable properties
    @Published var user = User()
    
    @Published var updates:[Update] = [Update]()
    
    @Published var series: [String: Series] = [String: Series]()
    
    // Current update
    @Published var currentUpdate: Update?
    @Published var currentUpdateId: String?
    var currentUpdateIndex = 0
    
    // Helper properties
    var updateRefs: [String] = [String]()
    var seriesRefs: [String: Float] = [String: Float]()
    
    init () {
        //self.series = DataService.getLocalData()
        getRemoteUser()
        //getRemoteUpdates()
        //getRemoteSeries()
    }
    
    func removeUpdate(id:String) {
        // logs update as read
        
        // updates firestore that update no longer relevant for user
        let userRef = db.collection("users").document("dlz")
        
        userRef.getDocument { snapshot, error in
            if error == nil && snapshot != nil {
                print(snapshot!.documentID)
                print(snapshot!.data() ?? "data")
            }
        }
        
        // removes update from array
        for i in 0..<self.updates.count {
            if self.updates[i].id == id {
                self.updates.remove(at: i)
                break
            }
        }
        
        // update self.updateRefs
        
    }
    
    func setCurrentUpdate(update: Update){
        // removes update from array
        for i in 0..<self.updates.count {
            if self.updates[i].id == update.id {
                self.currentUpdateIndex = i
                self.currentUpdate = self.updates[i]
            }
        }
    }
    
    func nextUpdate(remove: Bool) {
        
        // Advance the lesson index
        currentUpdateIndex += 1
        
        // Check that it is within range
        if currentUpdateIndex < self.updates.count {
            
            // Set the current lesson property
            currentUpdate = self.updates[currentUpdateIndex]
        }
        else {
            // Reset the lesson state
            currentUpdateIndex = 0
            currentUpdate = nil
        }
        
        if remove {
            print("remove")
        }
    }
    
    func hasNextUpdate() -> Bool {
        
        guard self.currentUpdate != nil else {
            return false
        }
        
        return (self.currentUpdateIndex + 1 < self.updates.count)
    }
    
    // MARK: Database query functions
    
    func getRemoteUser() {
        
        // parse user
        let userRef = db.collection("users")
        
        userRef.getDocuments { snapshot, error in
            if error == nil && snapshot != nil {
                
                for document in snapshot!.documents {
                    let userObj = User()
                    
                    userObj.id = document.documentID
                    userObj.firstName = document["first_name"] as? String ?? ""
                    userObj.lastName = document["last_name"] as? String ?? ""
                    
                    self.updateRefs = document["updates"] as? [String] ?? [""]
                    self.seriesRefs = document["series_reading"] as? [String: Float] ?? ["": 0]
                    
                    self.user = userObj
                    break
                }
            } else {
                print("User doesn't exist")
            }
        }
    }
    
    func getRemoteUpdates() {
        
        // parse updates
        var refs = [Query]()
        for search in self.updateRefs.chunked(into: 10) {
            refs.append(db.collection("updates").whereField(FieldPath.documentID(), in: search))
        }
        
        for updateRef in refs {
            updateRef.getDocuments { snapshot, error in
                if error == nil && snapshot != nil {
                    
                    print("reached loop")
                    // Holder for updates
                    var updates = [Update]()
                    
                    // Loop through updates to build relevant ones
                    for doc in snapshot!.documents {
                        let u = Update()
                        
                        u.id = doc.documentID
                        u.chapter = doc["last_chapter"] as? Float ?? 0
                        u.title = doc["title"] as? String ?? ""
                        u.url = doc["chapter_url"] as? String ?? ""
                        u.date = doc["date"] as? String ?? ""
                        u.source = doc["source"] as? String ?? ""
                        
                        updates.append(u)
                        print(u.id)
                    }
                    
                    self.updates += updates
                }
            }
        }
    }
     
    func getRemoteSeries() {
        // parsing series
        var refs = [Query]()
        for search in Array(self.seriesRefs.keys).chunked(into: 10) {
            refs.append(db.collection("series").whereField(FieldPath.documentID(), in: search))
        }
        
        for seriesRef in refs {
            seriesRef.getDocuments { snapshot, error in
                if error == nil && snapshot != nil {
                    
                    // Loop through series to build relevant ones
                    for doc in snapshot!.documents {
                        let s = Series()
                        
                        s.id = doc.documentID
                        s.lastChapter = doc["last_chapter"] as? Float ?? 0
                        s.lastReadChapter = self.seriesRefs[s.id] ?? 0
                        s.title = doc["title"] as? String ?? ""
                        s.image = doc["title"] as? String ?? ""
                        s.homeUrl = doc["home_url"] as? String ?? ""
                        s.timeSinceUpdate = 0
                        // chpt url?
                        s.source = doc["source"] as? String ?? ""
                        
                        self.series[s.id] = s
                    }
                }
            }
        }
    }
}

class DataService {
    static func getLocalData() -> [Series]{
        
        // Parse local json data
        
        // get a url to json data
        let pathString = Bundle.main.path(forResource: "series", ofType: "json")
        
        // check if path is there
        guard pathString != nil else {
            print("failed 1")
            return [Series]()
        }
        
        // Create URL object
        let url = URL(fileURLWithPath: pathString!)
        
        // turn into data object
        do {
            let data = try Data(contentsOf: url)
            
            // decode data object
            let decoder = JSONDecoder()
            
            do {
                let seriesData = try decoder.decode([Series].self, from: data)
                
                // return
                return seriesData
            }
            catch {
                print("failed 2")
                print(error)
            }
        }
        catch {
            print("failed 3")
            print(error)
        }
        print("failed 4")
        return [Series]()
    }
}
