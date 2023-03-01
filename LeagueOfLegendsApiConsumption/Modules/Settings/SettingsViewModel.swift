//
//  SettingsViewModel.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import Foundation

class SettingsViewModel : ObservableObject {
    
    @Published var ddragonPlatformRouting = DDragonPlatformRouting.LA1
    @Published var ddragonRegionalRouting = DDragonRegionalRouting.ASIA
    @Published var ddragonVersion = "10.0"
    
    init(_ ddragonSettings: DDragonSettings) {
        
    }
}
