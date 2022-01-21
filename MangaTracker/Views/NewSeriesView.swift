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
            VStack {
                TitleBarView(titleText: "New Series")
                    
                ScrollView {
                    
                    ForEach(Array(model.series.values)) { s in
                        if s.new {
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
                                            //model.addNewSeries(series: s)
                                            //some feedback to show this
                                        }
                                        .modifier(ButtonModifier())
                                        
                                        Button("Delete") {
                                            //model.removeNewSeries(series: s)
                                            //some feedback to show this
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
                
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .font(Font.system(size: 10).bold())
            .background(Color.blue.opacity(1))
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}


struct NewSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        NewSeriesView()
            .environmentObject(SeriesModel())
    }
}
