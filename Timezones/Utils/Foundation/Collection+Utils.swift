//
//  Collection+Utils.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation

public extension Collection {

    public func count(where predicate: ((Iterator.Element) throws -> Bool)) rethrows -> Int {

        guard self.isEmpty == false else { return 0 }

        return try self.reduce(0) { $0 + (try predicate($1) ? 1 : 0) }
    }

    public subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }

    public func any(match: (Element) throws -> Bool) rethrows -> Bool {

        return try self.first { try match($0) } != nil ? true : false
    }

    public func all(match: (Element) throws -> Bool) rethrows -> Bool {

        return try self.count { try match($0) } == self.count
    }
}
