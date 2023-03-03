//
//  SettingsUI.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import SwiftUI

struct SettingsUI: View {
    @EnvironmentObject private var mviContainer: SettingsContainer
    
    private var state: SettingsState { mviContainer.state }
    private var intent: SettingsIntent { mviContainer.intent }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings.ServerSectionHeader"), footer: Text("Settings.ServerSectionFooter")) {
                    NavigationLink {
                        List (DDragonPlatformRouting.allCases, id: \.self) { ddragonPlatformRouting in
                            Button {
                                state.ddragonPlatformRouting = ddragonPlatformRouting
                            } label: {
                                HStack {
                                    Text(String(describing: ddragonPlatformRouting))
                                        .foregroundColor(.secondary)
                                        .frame(width: 50, alignment: .leading)
                                    Text(ddragonPlatformRouting.rawValue)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if state.ddragonPlatformRouting == ddragonPlatformRouting {
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
                            Text(state.ddragonPlatformRouting.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    NavigationLink {
                        List (DDragonRegionalRouting.allCases, id: \.self) { ddragonRegionalRouting in
                            Button {
                                state.ddragonRegionalRouting = ddragonRegionalRouting
                            } label: {
                                HStack {
                                    Text(ddragonRegionalRouting.rawValue)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if state.ddragonRegionalRouting == ddragonRegionalRouting {
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
                            Text(state.ddragonRegionalRouting.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                Section(header: Text("Settings.ApiVersionSectionHeader")) {
                    NavigationLink {
                        Group {
                            if state.versionsIsLoading {
                                ProgressView()
                            } else {
                                List (state.versions, id: \.self) { ddragonVersion in
                                    Button {
                                        state.ddragonVersion = ddragonVersion
                                    } label: {
                                        HStack {
                                            Text(ddragonVersion)
                                                .foregroundColor(.primary)
                                            Spacer()
                                            if state.ddragonVersion == ddragonVersion {
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
                                intent.fetchVersions
                            }
                        }
                    } label: {
                        HStack {
                            Text("Settings.ApiVersion")
                            Spacer()
                            Text(state.ddragonVersion)
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
            .environmentObject(SettingsContainer())
    }
}
#endif
