//
//  ContentView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct AllSeriesView: View {
    
    @EnvironmentObject var model: SeriesModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("All Series")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    .padding(.top, 40)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity
              )
            
            ScrollView {
                ForEach(model.series) { s in
                    Image(s.image)
                        .resizable()
                        .frame(width: 150, height: 200)
                        .scaledToFill()
                        .cornerRadius(5)
                    Text(s.title)
                }
            }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity
            )

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllSeriesView()
            .environmentObject(SeriesModel())
    }
}
