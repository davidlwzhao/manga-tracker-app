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
            VStack(spacing: 0) {
                TitleBarView(titleText: "Updated Series")
                
                // if no updates then show placeholder
                // add number of updates as cirlce
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.updates) { u in

                            NavigationLink(tag: u.id, selection: $model.currentUpdateId) {
                                ReadView(index: 0).onAppear {
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
                  maxWidth: .infinity,
                  maxHeight: .infinity,
                  alignment: .topLeading)
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
