//
//  TimezoneInfoView.swift
//  Timezones
//
//  Created by Francisco Amado on 23/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

struct TimezoneInfo {

    let title: String?
    let subtitle: String?
    let caption: String?
}

class TimezoneInfoView: NSView, NibLoadable {

    @IBOutlet weak var title: NSTextField!
    @IBOutlet weak var subtitle: NSTextField!
    @IBOutlet weak var caption: NSTextField!

    override func draw(_ dirtyRect: NSRect) {

        super.draw(dirtyRect)

        // Drawing code here.
    }

    func render(with info: TimezoneInfo?) {

        title.cell?.title = info?.title ?? ""
        subtitle.cell?.title = info?.subtitle ?? ""
        caption.cell?.title = info?.caption ?? ""
    }
}
