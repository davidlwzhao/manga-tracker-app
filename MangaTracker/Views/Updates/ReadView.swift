//
//  ReadView.swift
//  MangaTracker
//
//  Created by David Zhao on 09/01/2022.
//

import SwiftUI

struct ReadView: View {
    
    @EnvironmentObject var model: SeriesModel
    @State var index = 0
    
    var body: some View {
        
        let update = model.currentUpdate
        
        VStack {
            VStack {
                TitleBarView(titleText: update?.title ?? "")
                
                HStack (spacing: 10){
                    
                    if model.hasPrevUpdate() || index > 1 {
                        Button {
                            if update?.chapters.count != nil {
                                if index > 1 {
                                    index -= 1
                                } else {
                                    index = 0
                                    model.prevUpdate()
                                }
                            }
                        } label: {
                            ZStack{
                                Capsule()
                                    .fill(.blue)
                                HStack {
                                    Image(systemName: "backward.end")
                                    Text("Previous")
                                }
                                .foregroundColor(.white)
                            }
                            .frame(width: 120, height:30)
                        }
                        .buttonStyle(.plain)
                    }

                    Button  {
                        
                        if update?.chapters.count != nil {
                            if index + 1 < update!.chapters.count {
                                index += 1
                            } else {
                                index = 0
                                model.nextUpdate()
                            }
                        }
                        
                    } label: {
                        ZStack{
                            Capsule()
                                .fill(.blue)
                            HStack {
                                Image(systemName: "escape")
                                Text("Skip")
                            }
                            .foregroundColor(.white)
                        }
                        .frame(width: 120, height:30)
                    }
                    .buttonStyle(.plain)

                    // OR has another chapter
                    if model.hasNextUpdate() || index + 1 < (update?.chapters.count ?? 0) {
                        Button  {
                            if update?.chapters.count != nil {
                                model.markUpdateForRemoval(index: index)
                                if index + 1 < update!.chapters.count {
                                    index += 1
                                } else {
                                    index = 0
                                    model.nextUpdate()
                                }
                            }
                        } label: {
                            ZStack{
                                Capsule()
                                    .fill(.blue)
                                HStack {
                                    Text("Next")
                                    Image(systemName: "forward.end")
                                }
                                .foregroundColor(.white)
                            }
                            .frame(width: 120, height:30)
                        }
                        .buttonStyle(.plain)
                    } else {
                        Button  {
                            model.markUpdateForRemoval(index: index)
                            model.removeUpdates()
                            model.currentUpdate = nil
                            model.currentUpdateIndex = 0
                            model.currentUpdateId = nil
                            index = 0
                        } label: {
                            ZStack{
                                Capsule()
                                    .fill(.blue)
                                HStack {
                                    Text("Complete")
                                    Image(systemName: "checkmark.circle")
                                }
                                .foregroundColor(.white)
                            }
                            .frame(width: 120, height:30)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.bottom, 10)
            }
            .background(.black)
            
            if update?.chapters[index].url != nil {
                WebView(url: URL(string: update!.chapters[index].url)!)
                    //.edgesIgnoringSafeArea(.bottom)
            }
        }
        .navigationBarHidden(true)
    }
}

//struct ReadView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReadView(url: "https://flamescans.org/player-starting-from-today-chapter-37/")
//    }
//}

