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
                            Text(viewModel.ddragonPlatformRouting.rawValue)
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
                            Text(viewModel.ddragonRegionalRouting.rawValue)
                                .font(.caption)
                                .bold()
                        }
                    }
                }
                Section (header: Text("Settings.ApiVersionSectionHeader")) {
                    HStack {
                        Text("Settings.ApiVersion")
                        Spacer()
                        Text(viewModel.ddragonVersion)
                            .font(.caption)
                            .bold()
                    }
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
