//
//  AppReducer.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation
import ReSwift

enum AppAction: Action {

    case fetchedAllCountries(countries: [String])
    case fetchedAllTimezones(timezones: [String])
    case addedSelection(timezone: String)
    case removedSelection()
    case selected(index: Int, timezone: String)
}

func appReducer(action: Action, state: AppState?) -> AppState {

    var state = state ?? AppState()

    guard let action = action as? AppAction else {

        return state
    }

    switch action {
        
    case .fetchedAllCountries(let countries):
        state.allCountries = countries

    case .fetchedAllTimezones(let timezones):

        let values: [String] = timezones.filter { timezone in
            state.timezoneState.timezones.contains(where: { $0 == timezone }) == false
        }

        state.allTimezones.append(contentsOf: values)

    case .addedSelection(let timezone):
        let values = state.timezoneState.timezones + [timezone]
        state.timezoneState.timezones = values

    case .removedSelection():
        state.timezoneState.timezones.removeLast()

    case .selected(let index, let timezone):
        state.timezoneState.timezones.insert(timezone, at: index)
        state.timezoneState.timezones.remove(at: index + 1)
    }

    return state
}
