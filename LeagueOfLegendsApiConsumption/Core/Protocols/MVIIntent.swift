//
//  MVIIntent.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 02/03/23.
//

import Foundation

protocol MVIItent {
    var state : MVIState { get }
    
    associatedtype MVIState
    
    init(_ state: MVIState)
}
