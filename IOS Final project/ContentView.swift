//
//  ContentView.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/26.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex=0
    @State var cafeResult=CafeResult(data: [Cafe]())
    @State var poemResult=PoemResult(data: [Poem]())
    
    var body: some View {
        TabView() {
            City(cafeResult: $cafeResult, selectedIndex: $selectedIndex)
                .tabItem{
                    Label("咖啡廳",systemImage: "star.fill")
                }
            DrawPoem(poemResult: $poemResult)
            .tabItem{
                Label("淺草籤",systemImage:"heart.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
