//
//  SeriesModel.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import Foundation

class SeriesModel: ObservableObject {
    
    @Published var series: [Series]
    
    init () {
        self.series = DataService.getLocalData()
        print(self.series)
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
                
                // add unique ids
                for r in seriesData {
                    r.id = UUID()
                }
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
