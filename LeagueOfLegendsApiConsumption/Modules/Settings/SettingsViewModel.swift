//
//  SettingsViewModel.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import Foundation

class SettingsViewModel : ObservableObject {
    
    @Published var ddragonPlatformRouting: DDragonPlatformRouting
    @Published var ddragonRegionalRouting: DDragonRegionalRouting
    @Published var ddragonVersion: String
    
    init() {
        ddragonPlatformRouting = DDragonPlatformRouting.LA1
        ddragonRegionalRouting = DDragonRegionalRouting.ASIA
        ddragonVersion = "10.0"
    }
}
