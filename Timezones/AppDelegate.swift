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

    let popover = NSPopover()
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    var appCoordinator: AppCoordinator!
    var eventMonitor: EventMonitor?

    fileprivate let appStore = AppStore(reducer: appReducer, state: nil)

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        appCoordinator = AppCoordinator(store: appStore)

        configureStatusItem()
        configurePopOver()
        configureEventMonitor()
    }
}
