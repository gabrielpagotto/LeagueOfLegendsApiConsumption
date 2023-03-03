//
//  SettingsContainer.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 02/03/23.
//

import Foundation
import Combine

final class SettingsContainer : MVIContainer<SettingsState, SettingsIntent> {
    init() {
        let state = SettingsState()
        let intent = SettingsIntent(state)
        super.init(state, intent)
    }
}
