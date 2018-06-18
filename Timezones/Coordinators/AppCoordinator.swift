//
//  AppCoordinator.swift
//  Timezones
//
//  Created by Francisco Amado on 16/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

class AppCoordinator {

    var mainViewController: MainViewController? = nil
    let popOverCoordinator: PopOverCoordinator

    init() {

        self.popOverCoordinator = PopOverCoordinator()
        self.popOverCoordinator.delegate = self
    }

    private var mainWindowController: MainWindowController?

    func openMainWindow(isRetry: Bool = false) {

        guard let mainWindowController = self.mainWindowController else {

            self.mainWindowController = MainWindowController.instantiate()

            if let window = NSApplication.shared.mainWindow {

                window.windowController = self.mainWindowController
            }

            if isRetry == false {

                self.openMainWindow(isRetry: true)
            }

            return
        }

        if let window = mainWindowController.window {

            window.center()
            window.makeKeyAndOrderFront(self)
        }
    }
}

extension AppCoordinator: PopOverCoordinatorDelegate {

    func selectSettings() {

        self.openMainWindow()
    }
}
