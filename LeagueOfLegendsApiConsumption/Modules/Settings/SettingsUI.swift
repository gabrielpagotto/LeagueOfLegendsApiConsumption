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
                            Label(ddragonPlatformRouting.rawValue, systemImage: ddragonSettings.ddragonPlatformRouting == ddragonPlatformRouting ? "checkmark" : "")
                                .onTapGesture {
                                    ddragonSettings.ddragonPlatformRouting = ddragonPlatformRouting
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
                                .bold()
                        }
                    }
                    NavigationLink {
                        List (DDragonRegionalRouting.allCases, id: \.self) { ddragonRegionalRouting in
                            Label(ddragonRegionalRouting.rawValue, systemImage: ddragonSettings.ddragonRegionalRouting == ddragonRegionalRouting ? "checkmark" : "")
                                .onTapGesture {
                                    ddragonSettings.ddragonRegionalRouting = ddragonRegionalRouting
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
                                .bold()
                        }
                    }
                }
                Section(header: Text("Settings.ApiVersionSectionHeader")) {
                    HStack {
                        Text("Settings.ApiVersion")
                        Spacer()
                        Text(ddragonSettings.ddragonVersion)
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
            .environmentObject(DDragonSettings())
    }
}
