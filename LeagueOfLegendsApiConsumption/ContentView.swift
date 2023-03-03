//
//  ContentView.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home.Title")
            }
            SettingsUI()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings.Title")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SettingsState())
    }
}
