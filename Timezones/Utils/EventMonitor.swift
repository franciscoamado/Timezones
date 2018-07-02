//
//  EventMonitor.swift
//  Timezones
//
//  Created by Francisco Amado on 16/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

public class EventMonitor {

    private var monitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void

    init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {

        self.mask = mask
        self.handler = handler
    }

    deinit {

        stop()
    }

    func start() {

        monitor = NSEvent.addGlobalMonitorForEvents(
            matching: mask,
            handler: handler
        )
    }

    func stop() {

        if let monitor = self.monitor {

            NSEvent.removeMonitor(monitor)
            self.monitor = nil
        }
    }
}
