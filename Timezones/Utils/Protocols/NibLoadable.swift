//
//  NibLoadable.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation

protocol NibLoadable {

    static var nibName: String { get }
    static func instantiate(in bundle: Bundle) -> Self?
}
