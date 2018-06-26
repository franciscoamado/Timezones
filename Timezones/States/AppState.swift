//
//  AppState.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation
import ReSwift

struct TimezoneState: StateType {

    var timezones: [String] = []
}

struct AppState: StateType {

    var startAtLogin: Bool = true
    var countryName: String? = nil // "Portugal",
    var countryIdentifier: String? = nil // "PT",
    var allCountries: [String] = []
    var allTimezones: [String] = []
    var timezoneState: TimezoneState = .init()
}
