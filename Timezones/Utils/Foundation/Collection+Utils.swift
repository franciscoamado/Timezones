//
//  Collection+Utils.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation

public extension Collection {

    public subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}
