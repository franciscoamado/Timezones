//
//  NSView+Utils.swift
//  Timezones
//
//  Created by Francisco Amado on 26/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

extension NibLoadable where Self: NSView {

    static var nibName: String {

        return String(describing: Self.self)
    }

    static func instantiate(in bundle: Bundle = Bundle.main) -> Self? {

        var topLevelArray: NSArray? = nil

        bundle.loadNibNamed(nibName, owner: self, topLevelObjects: &topLevelArray)

        guard let results = topLevelArray else { return nil }

        let views = Array<Any>(results).filter { $0 is Self }

        return views.last as? Self
    }
}
