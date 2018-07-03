//
//  Locale+Utils.swift
//  Timezones
//
//  Created by Francisco Amado on 24/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation

extension NSLocale {

    class var allCountriesIdentifiers: [String] {

        let countries = NSLocale.isoCountryCodes.compactMap { $0 }

        return countries.sorted()
    }

    class var allCountriesLocalized: [String] {

        let locale = NSLocale.current
        let countries = NSLocale.isoCountryCodes.compactMap { locale.localizedString(forRegionCode: $0) }

        return countries.sorted()
    }
}
