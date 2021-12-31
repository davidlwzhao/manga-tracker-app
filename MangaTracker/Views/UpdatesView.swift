//
//  UpdatesView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct UpdatesView: View {
    
    @EnvironmentObject var model: SeriesModel
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            VStack {
                Text("All Series")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(.top, 40)
                Divider()
            }
            .background(.black)
            
            ScrollView {
                ForEach(model.series) { s in
                    
                    if s.updated {
                    
                        Button  {
                            openURL(URL(string: s.url)!)
                        } label: {
                            HStack {
                                Image(s.image)
                                    .resizable()
                                    .frame(width: 150, height: 200)
                                    .scaledToFill()
                                    .cornerRadius(5)
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(s.title)
                                        .bold()
                                    Text("Latest Chapter:  \(s.chapters)")
                                    Text("Last Updated:  \(s.lastUpdate)")
                                    Text("Source: \(s.source)")
                                }
                                Spacer()
                            }
                        }
                        Divider()

                    }
                }
            }
            .padding()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )

    }
}


struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView()
            .environmentObject(SeriesModel())
    }
}
