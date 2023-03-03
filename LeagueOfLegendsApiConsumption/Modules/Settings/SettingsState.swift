//
//  SettingsState.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 02/03/23.
//

import Foundation

class SettingsState : ObservableObject {
    
    @Published var ddragonPlatformRouting = DDragonPlatformRouting.LA1
    @Published var ddragonRegionalRouting = DDragonRegionalRouting.ASIA
    @Published var ddragonVersion = "10.0"
    @Published var versions: [String] = []
    @Published var versionsIsLoading = true
    
}
