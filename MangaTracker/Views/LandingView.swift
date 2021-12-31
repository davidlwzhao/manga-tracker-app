//
//  LandingView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        TabView {
            UpdatesView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock.badge.exclamationmark")
                        Text("Updates")
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
            AllSeriesView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.3x3.square")
                        Text("All Series")
                    }
                }
                .tag(3)
            AnalyticsView()
                .tabItem {
                    VStack {
                        Image(systemName: "chart.xyaxis.line")
                        Text("Analytics")
                    }
                }
                .tag(4)
        }
        .environmentObject(SeriesModel())
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
