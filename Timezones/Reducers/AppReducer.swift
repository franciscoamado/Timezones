//
//  AppReducer.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation
import ReSwift
import LaunchAtLogin

enum AppAction: Action {

    case fetchedAllCountries(countries: [String])
    case fetchedAllTimezones(timezones: [TimeZone])
    case fetchedSavedTimezones(timezones: [TimeZone])
    case addedSelection(timezone: TimeZone)
    case removedSelection()
    case selected(index: Int, timezone: TimeZone)

    case fetchLaunchAtLogin()
    case launchAtLogin(option: Bool)
}

func appReducer(action: Action, state: AppState?) -> AppState {

    var state = state ?? AppState()

    guard let action = action as? AppAction else { return state }

    switch action {
        
    case .fetchedAllCountries(let countries):
        state.allCountries = countries

    case .fetchedAllTimezones(let timezones):
        state.allTimezones = timezones

    case .fetchedSavedTimezones(let timezones):
        state.timezoneState.timezones = timezones

    case .addedSelection(let timezone):
        state.timezoneState.timezones.append(timezone)

    case .removedSelection():
        state.timezoneState.timezones.removeLast()

    case .selected(let index, let timezone):
        state.timezoneState.timezones.insert(timezone, at: index)
        state.timezoneState.timezones.remove(at: index + 1)

    case .fetchLaunchAtLogin():
        state.startAtLogin = LaunchAtLogin.isEnabled

    case .launchAtLogin(let option):
        LaunchAtLogin.isEnabled = option
        state.startAtLogin = option
    }

    return state
}
