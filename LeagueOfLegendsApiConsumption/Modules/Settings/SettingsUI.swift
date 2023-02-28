//
//  SettingsUI.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import SwiftUI

struct SettingsUI: View {
    @ObservedObject private(set) var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings.ServerSectionHeader"), footer: Text("Settings.ServerSectionFooter")) {
                    NavigationLink {
                        List {
                            ForEach(DDragonPlatformRouting.allCases, id: \.self) { ddragonPlatformRouting in
                                Text(ddragonPlatformRouting.rawValue)
                            }
                        }
                        .navigationTitle("Settings.ServerByCountry")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack {
                            Text("Settings.ServerByCountry")
                            Spacer()
                            Text("br1.api.riotgames.com")
                                .font(.caption)
                                .bold()
                        }
                    }
                    NavigationLink {
                        List {
                            ForEach(DDragonRegionalRouting.allCases, id: \.self) { ddragonRegionalRouting in
                                Text(ddragonRegionalRouting.rawValue)
                            }
                        }
                        .navigationTitle("Settings.ServerByContinent")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack {
                            Text("Settings.ServerByContinent")
                            Spacer()
                            Text("americas.api.riotgames.com")
                                .font(.caption)
                                .bold()
                        }
                    }
                }
                Section (header: Text("Settings.ApiVersionSectionHeader")) {
                    Text("Settings.ApiVersion")
                }
            }
            .navigationTitle("Settings.Title")
        }
    }
}

struct SettingsUI_Previews: PreviewProvider {
    static var previews: some View {
        SettingsUI()
    }
}
