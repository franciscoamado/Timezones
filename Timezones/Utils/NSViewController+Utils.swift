//
//  NSViewController+Utils.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

extension NibLoadable where Self: NSViewController {

    static var nibName: String {

        return String(describing: Self.self)
    }

    static func instantiate(in bundle: Bundle = Bundle.main) -> Self? {

        return .init(nibName: nibName, bundle: bundle)
    }
}
