//
//  UpdatesView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct UpdatesView: View {
    
    @EnvironmentObject var model: SeriesModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.05)
                    .ignoresSafeArea()
                    .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity)
                VStack(spacing: 0) {
                    VStack {
                        Text("Updated Series")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(.top, 20)
                        Divider()
                    }
                    .background(.black)
                        
                        ScrollView {
                            LazyVStack {
                                ForEach(model.updates) { u in
                                    //let s = model.series["\(u.title)-\(u.source)"]!

                                    NavigationLink(tag: u.id, selection: $model.currentUpdateId) {
                                        ReadView().onAppear {
                                            model.setCurrentUpdate(update: u)
                                        }
                                    } label: {
                                        UpdateRowView(u: u)
                                            .accentColor(.black)
                                    }
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
                      alignment: .topLeading)
            }
            .navigationBarHidden(true)
        }
    }
}


struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView()
            .environmentObject(SeriesModel())
    }
}
