//
//  MangaTrackerApp.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI
import Firebase

@main
struct MangaTrackerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
