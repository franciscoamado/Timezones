//
//  AppDelegate+Configuration.swift
//  Timezones
//
//  Created by Francisco Amado on 02/07/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

// MARK: - Configuration
extension AppDelegate {

    func configureStatusItem() {

        statusItem.button?.image = NSImage(named: "icon_status_bar")
        statusItem.button?.action = #selector(togglePopover(_:))
    }

    func configurePopOver() {

        popover.contentViewController = appCoordinator?.popOverCoordinator.viewController
        popover.animates = false
        popover.behavior = .transient
    }

    func configureEventMonitor() {

        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in

            self?.closePopover(sender: event)
        }

        eventMonitor?.start()
    }
}

// MARK: - Actions
fileprivate extension AppDelegate {

    @objc func togglePopover(_ sender: Any?) {

        if popover.isShown {

            closePopover(sender: sender)

        } else {

            showPopover(sender: sender)
        }
    }

    func showPopover(sender: Any?) {

        if let button = statusItem.button {

            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

    func closePopover(sender: Any?) {

        popover.performClose(sender)
    }
}

