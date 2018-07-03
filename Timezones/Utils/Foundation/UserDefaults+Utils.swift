//
//  UserDefaults+Utils.swift
//  Timezones
//
//  Created by Francisco Amado on 03/07/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation

fileprivate extension UserDefaults {

    enum Keys {

        static let timezones = "timezones"
    }
}

// Timezones I/O
extension UserDefaults {

    func save(_ timezones: [TimeZone]) {

        let identifiers = timezones.map { $0.identifier }

        set(identifiers, forKey: Keys.timezones)
    }

    func timezones() -> [TimeZone] {

        let identifiers = (array(forKey: Keys.timezones) as? [String]) ?? []
        let timezones = identifiers.compactMap { TimeZone(identifier: $0) }

        return timezones
    }
}
