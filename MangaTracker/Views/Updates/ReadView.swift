//
//  ReadView.swift
//  MangaTracker
//
//  Created by David Zhao on 09/01/2022.
//

import SwiftUI

struct ReadView: View {
    
    @EnvironmentObject var model: SeriesModel
    
    var body: some View {
        
        let update = model.currentUpdate
        
        VStack {
            VStack {
                TitleBarView(titleText: update?.title ?? "")
                
                HStack (spacing: 10){
                    
                    Button {
                        print("prev")
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

                    Button  {
                        model.nextUpdate(remove: false)
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

                    if model.hasNextUpdate() {
                        Button  {
                            model.nextUpdate(remove: true)
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
                            model.currentUpdate = nil
                            model.currentUpdateIndex = 0
                            model.currentUpdateId = nil
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
            
            if update?.url != nil {
                WebView(url: URL(string: update!.url)!)
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

