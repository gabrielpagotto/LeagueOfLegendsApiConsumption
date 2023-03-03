//
//  LeagueOfLegendsApiConsumptionApp.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import SwiftUI

@main
struct LeagueOfLegendsApiConsumptionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SettingsContainer())
        }
    }
}
