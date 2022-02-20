//
//  NewSeriesRowView.swift
//  MangaTracker
//
//  Created by David Zhao on 20/02/2022.
//

import SwiftUI

struct NewSeriesRowView: View {
    
    @EnvironmentObject var model: SeriesModel
    let s: Series
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 200)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            HStack(alignment: .top, spacing: 10) {
                Image(s.image)
                    .resizable()
                    .frame(width: 100, height: 130)
                    .cornerRadius(5)
                VStack(alignment: .leading, spacing: 5) {
                    Text(s.title)
                        .font(.caption)
                        .bold()
                    Text("Source: \(s.source)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(30)
                    
                    Button("Add to Read List") {
                        model.addNewSeries(series: s)
                    }
                    .modifier(ButtonModifier())
                    
                    Button("Delete") {
                        model.removeNewSeries(series: s)
                    }
                    .modifier(ButtonModifier())
                    
                    NavigationLink {
                        SeriesHomeReadView(url: s.homeUrl, title: s.title)
                    } label: {
                        Text("Visit Series")
                        .modifier(ButtonModifier())
                    }
                    
                }
                .padding(.leading, 10)
                
            }
        }
        .padding(.horizontal, 5)
    }
}
