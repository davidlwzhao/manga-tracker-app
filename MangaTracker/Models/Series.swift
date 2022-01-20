//
//  SeriesModel.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import Foundation

class Series: Decodable, Identifiable {
    var id: String = ""
    var title: String = ""
    var image :String = ""
    var lastChapter: Float = 0
    var timeSinceUpdate: Int = 0
    var lastReadChapter: Float = 0
    var source: String = ""
    var homeUrl: String = ""
    //var lastUpdate: Update = Update()
}

class Update: Decodable, Identifiable {
    var id: String = ""
    var title: String = ""
    var source: String = ""
    
    var chapters: [ChapterUpdate] = [ChapterUpdate]()
}

class ChapterUpdate: Decodable, Identifiable {
    var id: String = ""
    var chapter: Float = 0
    var url: String = ""
    var date: String = ""
    
    func getTimeSinceUpdate() -> String {
        return "1 hr ago"
    }
}

class User: Decodable, Identifiable {
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    
    // are these needed?
    var seriesReading: [Series] = [Series]() 
    var seriesUpdates: [Update] = [Update]()
}
