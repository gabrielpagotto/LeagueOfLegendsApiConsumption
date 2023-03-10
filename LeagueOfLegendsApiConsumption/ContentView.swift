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
            NavigationView {
                Text("")
                .navigationTitle("Campeões")
            }
            .tabItem {
                AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/5.5.1/img/ui/champion.png"))
                Text("Campeões")
            }
            NavigationView {
                Text("Itens")
                .navigationTitle("Itens")
            }
            .tabItem {
                AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/5.5.1/img/ui/items.png"))
                Text("Itens")
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
            .environmentObject(SettingsContainer())
    }
}
