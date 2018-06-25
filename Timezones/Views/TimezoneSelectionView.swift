//
//  TimezoneSelectionView.swift
//  Timezones
//
//  Created by Francisco Amado on 23/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

@IBDesignable
class TimezoneSelectionButton: NSPopUpButton {

    override init(frame buttonFrame: NSRect, pullsDown flag: Bool) {
        super.init(frame: buttonFrame, pullsDown: flag)
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init?(coder:) not implemented")
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
}

extension TimezoneSelectionButton {

    convenience init() {
        self.init(frame: .zero, pullsDown: false)
    }
}
