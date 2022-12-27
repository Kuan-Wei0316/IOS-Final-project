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
                    Label("\(selectedIndex)",systemImage: "house.fill")
                }
            DrawPoem(poemResult: $poemResult)
            .tabItem{
                Label("Teams",systemImage: "sportscourt.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
