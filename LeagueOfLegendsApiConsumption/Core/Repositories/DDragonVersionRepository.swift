//
//  DDragonVersionRepository.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 02/03/23.
//

import Foundation

class DDragonVersionRepository : ObservableObject {
    
    static func versions() async -> [String] {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/api/versions.json") else { fatalError("Missing URL") }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                fatalError("Error in request")
            }
            return try JSONDecoder().decode([String].self, from: data)
        }
        catch {
            print("Requisition failed")
            return []
        }
    }
}
