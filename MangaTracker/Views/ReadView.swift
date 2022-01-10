//
//  ReadView.swift
//  MangaTracker
//
//  Created by David Zhao on 09/01/2022.
//

import SwiftUI

struct ReadView: View {
    var body: some View {
        VStack {
            Text("Title")
            HStack{
                Text("Prev")
                Text("Next")
            }
            WebView(url: URL(string: "https://reaperscans.com/series/kill-the-hero/chapter-83/")!)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView()
    }
}
