//
//  ContentView.swift
//  MangaTracker
//
//  Created by David Zhao on 31/12/2021.
//

import SwiftUI

struct AllSeriesView: View {
    var body: some View {
        VStack {
            VStack {
                Text("All Series")
                    .bold()
                // filter 1
                
                // filter 2
            }
            
            VStack {
                Image("cover-175x238")
                Image("ASNIP-1")
                Image("AnyConv.com__OG")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllSeriesView()
    }
}
