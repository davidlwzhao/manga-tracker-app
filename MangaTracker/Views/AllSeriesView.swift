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
                VStack {
                    Text("All Series")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.top, 20)
                    Divider()
                }
                .background(.black)
                    
                ScrollView {
                    LazyVGrid(columns: layout, spacing: 0) {
                        ForEach(Array(model.series.values)) { s in
                            NavigationLink {
                                ReadView(url: s.homeUrl)
                            } label: {
                                AllSeriesCardView(s: s)
                                    .accentColor(.black)
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
