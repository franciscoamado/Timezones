//
//  TimeZone+Utils.swift
//  Timezones
//
//  Created by Francisco Amado on 24/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation

extension TimeZone {

    static var GMT: TimeZone? {

        return all.filter { $0.identifier == "GMT" }.first
    }

    var formatted: String {

        let date = Date()
        let abbreviation = self.abbreviation(for: date)
        let localizedName = self.localizedName(for: .generic, locale: Locale.current)
        let identifier = self.identifier.components(separatedBy: "/").first

        var string = ""
        let _ = abbreviation.map { string.append($0) }
        let _ = localizedName.map { string.append(": \($0)") }
        let _ = identifier.map { string.append(" (\($0))") }

        return string
    }

    static var all: [TimeZone] {

        return TimeZone.knownTimeZoneIdentifiers.compactMap { TimeZone(identifier: $0) }
    }
}
