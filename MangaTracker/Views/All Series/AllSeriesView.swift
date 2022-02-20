//
//  ContentView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct AllSeriesView: View {
    
    @EnvironmentObject var model: SeriesModel
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                TitleBarView(titleText: "All Series")
                    
                ScrollView {
                    LazyVGrid(columns: layout, spacing: 0) {
                        ForEach(Array(model.series.values)) { s in
                            NavigationLink {
                                SeriesHomeReadView(url: s.homeUrl, title: s.title)
                            } label: {
                                VStack {
                                    AllSeriesCardView(s: s)
                                        .accentColor(.black)
                                    HStack {
                                        Button("Delete") {
                                            model.removeSeries(series: s)
                                        }
                                        .modifier(ButtonModifier())
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllSeriesView()
            .environmentObject(SeriesModel())
    }
}
