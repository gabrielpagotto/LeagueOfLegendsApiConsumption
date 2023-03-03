//
//  SettingsIntent.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 02/03/23.
//

import Foundation

final class SettingsIntent : MVIItent {
    var state: SettingsState
    
    required init(_ state: SettingsState) {
        self.state = state
    }
    
    @MainActor
    func fetchVersions() async {
        state.versionsIsLoading = true
        state.versions = await DDragonVersionRepository.versions()
        state.versionsIsLoading = false
    }
}
