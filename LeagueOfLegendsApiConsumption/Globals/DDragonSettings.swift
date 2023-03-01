//
//  DDragonGlobalVariables.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 28/02/23.
//

import Foundation

class DDragonSettings : ObservableObject {
    
    @Published var ddragonPlatformRouting = DDragonPlatformRouting.LA1
    @Published var ddragonRegionalRouting = DDragonRegionalRouting.ASIA
    @Published var ddragonVersion = "10.0"
}
