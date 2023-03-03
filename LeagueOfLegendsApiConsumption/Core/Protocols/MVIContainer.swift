//
//  MVIContainerProtocol.swift
//  LeagueOfLegendsApiConsumption
//
//  Created by Gabriel Pagotto on 02/03/23.
//

import Foundation
import Combine

class MVIContainer<S : MVIState, I : MVIItent> : ObservableObject {
    var state : S
    var intent : I
    var cancellable: Set<AnyCancellable>
    
    init(_ state: S, _ intent: I) {
        self.state = state
        self.intent = intent
        self.cancellable = []
        self.state.objectWillChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}
