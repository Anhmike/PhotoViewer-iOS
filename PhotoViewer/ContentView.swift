//
//  ContentView.swift
//  PhotoViewer
//
//  Created by Ginger on 20/10/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var randomImages = UnsplashData()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(randomImages.photoArray, id: \.id) { photo in
                    #if os(iOS)
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 200, alignment: .center)
                        .cornerRadius(15)
                    #else
                    
                    #endif
                    if photo.alt_description != nil {
                        Text(photo.alt_description!).font(.footnote)
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle("Random List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
