//
//  LandingView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct LandingView: View {
    
    @EnvironmentObject var model: SeriesModel
    @State var currentTab: Int = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            UpdatesView()
                .modifier(BackgroundModifier())
                .tabItem {
                    VStack {
                        Image(systemName: "clock.badge.exclamationmark")
                        Text("Updates")
                    }
                }
                .tag(0)
                .onAppear {
                    model.getRemoteUpdates()
                }
            
            AllSeriesView()
                .modifier(BackgroundModifier())
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.3x3.square")
                        Text("All Series")
                    }
                }
                .tag(1)
                .onAppear {
                    model.getRemoteSeries()
                }
            
            NewSeriesView()
                .modifier(BackgroundModifier())
                .tabItem {
                    VStack {
                        Image(systemName: "hourglass.badge.plus")
                        Text("New Series")
                    }
                }
                .tag(2)
            
            AnalyticsView()
                .modifier(BackgroundModifier())
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

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.20).ignoresSafeArea())
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .environmentObject(SeriesModel())
    }
}
