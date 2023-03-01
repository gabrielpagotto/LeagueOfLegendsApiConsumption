//
//  SettingsUI.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 27/02/23.
//

import SwiftUI

struct SettingsUI: View {
    @EnvironmentObject private var ddragonSettings: DDragonSettings
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings.ServerSectionHeader"), footer: Text("Settings.ServerSectionFooter")) {
                    NavigationLink {
                        List (DDragonPlatformRouting.allCases, id: \.self) { ddragonPlatformRouting in
                            Button {
                                ddragonSettings.ddragonPlatformRouting = ddragonPlatformRouting
                            } label: {
                                HStack {
                                    Text(ddragonPlatformRouting.rawValue)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if ddragonSettings.ddragonPlatformRouting == ddragonPlatformRouting {
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
                            Text(ddragonSettings.ddragonPlatformRouting.rawValue)
                                .font(.caption)
                        }
                    }
                    NavigationLink {
                        List (DDragonRegionalRouting.allCases, id: \.self) { ddragonRegionalRouting in
                            Button {
                                ddragonSettings.ddragonRegionalRouting = ddragonRegionalRouting
                            } label: {
                                HStack {
                                    Text(ddragonRegionalRouting.rawValue)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if ddragonSettings.ddragonRegionalRouting == ddragonRegionalRouting {
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
                            Text(ddragonSettings.ddragonRegionalRouting.rawValue)
                                .font(.caption)
                        }
                    }
                }
                Section(header: Text("Settings.ApiVersionSectionHeader")) {
                    HStack {
                        Text("Settings.ApiVersion")
                        Spacer()
                        Text(ddragonSettings.ddragonVersion)
                            .font(.caption)
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
            .environmentObject(DDragonSettings())
    }
}
