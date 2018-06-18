//
//  AppDelegate.swift
//  Timezones
//
//  Created by Francisco Amado on 13/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    fileprivate var appCoordinator: AppCoordinator?
    fileprivate let popover = NSPopover()
    fileprivate let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    fileprivate var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        self.appCoordinator = AppCoordinator()

        self.configureStatusItem()
        self.configurePopOver()
        self.configureEventMonitor()
    }
}

// MARK: - Configuration
fileprivate extension AppDelegate {

    @objc func togglePopover(_ sender: Any?) {

        if self.popover.isShown {

            self.closePopover(sender: sender)

        } else {

            self.showPopover(sender: sender)
        }
    }

    func configureStatusItem() {

        self.statusItem.button?.image = NSImage(named: "icon_status_bar")
        self.statusItem.button?.action = #selector(togglePopover(_:))
    }

    func configurePopOver() {

        self.popover.contentViewController = self.appCoordinator?.popOverCoordinator.viewController
        self.popover.animates = false
        self.popover.behavior = .transient
    }

    func configureEventMonitor() {

        self.eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in

            self?.closePopover(sender: event)
        }

        self.eventMonitor?.start()
    }
}

// MARK: - Actions
fileprivate extension AppDelegate {

    func showPopover(sender: Any?) {

        if let button = self.statusItem.button {

            self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

    func closePopover(sender: Any?) {

        self.popover.performClose(sender)
    }
}
