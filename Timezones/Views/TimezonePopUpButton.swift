//
//  TimezonePopUpButton.swift
//  Timezones
//
//  Created by Francisco Amado on 23/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

protocol TimezonePopUpButtonDelegate: class {

    func didFinishSelection(button: TimezonePopUpButton, selected: TimeZone?)
}

class TimezonePopUpButton: NSPopUpButton {

    var timezones: [TimeZone] = []
    fileprivate var selected: TimeZone?

    weak var delegate: TimezonePopUpButtonDelegate?

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

    override func didCloseMenu(_ menu: NSMenu, with event: NSEvent?) {

        super.didCloseMenu(menu, with: event)

        synchronizeTitleAndSelectedItem()
        let timezone = timezones.filter { $0.formatted == titleOfSelectedItem }.first
        delegate?.didFinishSelection(button: self, selected: timezone)
    }
}

extension TimezonePopUpButton {

    convenience init(timezones: [TimeZone], selected: TimeZone? = nil) {

        self.init(frame: .zero, pullsDown: false)

        self.timezones = timezones
        self.selected = selected

        addItems(withTitles: timezones.map({ $0.formatted }))

        if let selected = selected {

            selectItem(withTitle: selected.formatted)
            synchronizeTitleAndSelectedItem()
        }
    }
}
