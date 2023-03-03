//
//  SettingsUI.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import SwiftUI

struct SettingsUI: View {
    @EnvironmentObject private var settingsState: SettingsState
    
    @MainActor
    func fetchVersions() async {
        if settingsState.versions.isEmpty {
            settingsState.versionsIsLoading = true
            settingsState.versions = await DDragonVersionRepository.versions()
            settingsState.versionsIsLoading = false
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings.ServerSectionHeader"), footer: Text("Settings.ServerSectionFooter")) {
                    NavigationLink {
                        List (DDragonPlatformRouting.allCases, id: \.self) { ddragonPlatformRouting in
                            Button {
                                settingsState.ddragonPlatformRouting = ddragonPlatformRouting
                            } label: {
                                HStack {
                                    Text(String(describing: ddragonPlatformRouting))
                                        .foregroundColor(.secondary)
                                        .frame(width: 50, alignment: .leading)
                                    Text(ddragonPlatformRouting.rawValue)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if settingsState.ddragonPlatformRouting == ddragonPlatformRouting {
                                        Image(systemName: "checkmark")
                                            .bold()
                                            .foregroundColor(Color.accentColor)
                                    }
                                }
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .navigationTitle("Settings.ServerByCountry")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack {
                            Text("Settings.ServerByCountry")
                            Spacer()
                            Text(settingsState.ddragonPlatformRouting.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    NavigationLink {
                        List (DDragonRegionalRouting.allCases, id: \.self) { ddragonRegionalRouting in
                            Button {
                                settingsState.ddragonRegionalRouting = ddragonRegionalRouting
                            } label: {
                                HStack {
                                    Text(ddragonRegionalRouting.rawValue)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if settingsState.ddragonRegionalRouting == ddragonRegionalRouting {
                                        Image(systemName: "checkmark")
                                            .bold()
                                            .foregroundColor(Color.accentColor)
                                    }
                                }
                            }
                        }
                        .navigationTitle("Settings.ServerByContinent")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack {
                            Text("Settings.ServerByContinent")
                            Spacer()
                            Text(settingsState.ddragonRegionalRouting.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                Section(header: Text("Settings.ApiVersionSectionHeader")) {
                    NavigationLink {
                        Group {
                            if settingsState.versionsIsLoading {
                                Text("Carregando...")
                            } else {
                                List (settingsState.versions, id: \.self) { ddragonVersion in
                                    Button {
                                        settingsState.ddragonVersion = ddragonVersion
                                    } label: {
                                        HStack {
                                            Text(ddragonVersion)
                                                .foregroundColor(.primary)
                                            Spacer()
                                            if settingsState.ddragonVersion == ddragonVersion {
                                                Image(systemName: "checkmark")
                                                    .bold()
                                                    .foregroundColor(Color.accentColor)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .navigationTitle("Settings.ApiVersion")
                        .navigationBarTitleDisplayMode(.inline)
                        .onAppear {
                            Task {
                                await fetchVersions()
                            }
                        }
                    } label: {
                        HStack {
                            Text("Settings.ApiVersion")
                            Spacer()
                            Text(settingsState.ddragonVersion)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Settings.Title")
        }
    }
}


#if DEBUG
struct SettingsUI_Previews: PreviewProvider {
    static var previews: some View {
        SettingsUI()
            .environmentObject(SettingsState())
    }
}
#endif
