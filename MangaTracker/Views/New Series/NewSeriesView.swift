//
//  NewSeriesView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct NewSeriesView: View {
    
    @EnvironmentObject var model: SeriesModel
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                TitleBarView(titleText: "New Series")
                
                // if no updates then show placeholder
                // add number of updates as cirlce
                if model.newRefs.count == 0 {
                    VStack {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .foregroundColor(Color.secondary)
                            .frame(width: 120, height: 120)
                            .padding(.bottom, 10)
                            .padding(.top, 200)
                        HStack {
                            Text("No More New Series")
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(model.newSeries) { s in
                                NewSeriesRowView(s: s)
                                    .accentColor(.black)
                                
                            }
                        }
                    }
                    .padding()
                }
            }
            .frame(
                  maxWidth: .infinity,
                  maxHeight: .infinity,
                  alignment: .topLeading)
            
            .navigationBarHidden(true)
        }
    }
}


struct NewSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        NewSeriesView()
            .environmentObject(SeriesModel())
    }
}
