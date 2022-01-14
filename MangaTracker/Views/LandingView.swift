//
//  LandingView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct LandingView: View {
    
    @State var currentTab: Int = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            UpdatesView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock.badge.exclamationmark")
                        Text("Updates")
                    }
                }
                .tag(0)
            
            AllSeriesView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.3x3.square")
                        Text("All Series")
                    }
                }
                .tag(1)
            
            NewSeriesView()
                .tabItem {
                    VStack {
                        Image(systemName: "hourglass.badge.plus")
                        Text("New Series")
                    }
                }
                .tag(2)
            
            AnalyticsView()
                .tabItem {
                    VStack {
                        Image(systemName: "chart.xyaxis.line")
                        Text("Analytics")
                    }
                }
                .tag(3)
        }
        //.tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .environmentObject(SeriesModel())
    }
}
