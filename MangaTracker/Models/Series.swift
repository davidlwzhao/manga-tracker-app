//
//  SeriesModel.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import Foundation

class Series: Decodable, Identifiable {
    var id:UUID?
    var title:String
    var archived:Bool
    var updated:Bool
    var image:String
    var chapters:Int
    var lastUpdate:String
    var source: String
    var url: String
}
