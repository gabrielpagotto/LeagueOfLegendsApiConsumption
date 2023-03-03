//
//  SettingsIntent.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 02/03/23.
//

import Foundation

class SettingsIntent {
    var settingsState: SettingsState
    
    init(settingsState: SettingsState) {
        self.settingsState = settingsState
    }
    
    @MainActor
    func fetchVersions() async {
        settingsState.versionsIsLoading = true
        settingsState.versions = await DDragonVersionRepository.versions()
        settingsState.versionsIsLoading = false
    }
}
