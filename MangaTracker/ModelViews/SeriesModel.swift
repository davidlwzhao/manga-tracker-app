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
    
    // Helper properties
    var updateRefs: [String] = [String]()
    var seriesRefs: [String: Float] = [String: Float]()
    
    init () {
        //self.series = DataService.getLocalData()
        getRemoteUser()
        getRemoteUpdates()
        getRemoteSeries()
    }
    
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
        //self.updateRefs
        let updateRef = db.collection("updates").whereField(FieldPath.documentID(), in: ["A Returner’s Magic Should Be Special -Flame Scans-174", "Worn and Torn Newbie-Asura Scans-77", "Max Level Returner -Flame Scans-138"]) //TO DO: make this 10 limit
        
        updateRef.getDocuments { snapshot, error in
            if error == nil && snapshot != nil {
                
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
                }
                
                self.updates = updates
            }
        }
    }
     
    func getRemoteSeries() {
        // parsing series
        //Array(self.seriesRefs.keys)
        let seriesRef = db.collection("series").whereField(FieldPath.documentID(), in: ["Worn and Torn Newbie-Asura Scans", "A Returner’s Magic Should Be Special-Flame Scans", "Max Level Returner-Flame Scans"])
        
        seriesRef.getDocuments { snapshot, error in
            if error == nil && snapshot != nil {
                
                // Holder for updates
                var series = [String: Series]()
                
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
                    
                    series[s.id] = s
                }
            
                self.series = series
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
