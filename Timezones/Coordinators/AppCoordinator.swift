//
//  AppCoordinator.swift
//  Timezones
//
//  Created by Francisco Amado on 16/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa
import ReSwift
import LaunchAtLogin

class AppCoordinator {

    let popOverCoordinator: PopOverCoordinator
    var mainViewController: MainViewController? = nil

    var store: AppStore

    fileprivate let userDefaults: UserDefaults

    init(store: AppStore,
         popOverCoordinator: PopOverCoordinator? = nil,
         userDefaults: UserDefaults = .standard) {

        self.store = store
        self.userDefaults = userDefaults
        self.popOverCoordinator = popOverCoordinator ?? PopOverCoordinator(state: store.state.timezoneState)

        self.popOverCoordinator.delegate = self
        self.store.subscribe(self)
        self.fetchAllCountries()
        self.fetchAllTimezones()
        self.fetchSavedTimezones()
        self.fetchLaunchAtLogin()
    }

    private var mainWindowController: MainWindowController?

    func openMainWindow(isRetry: Bool = false) {

        guard let mainWindowController = self.mainWindowController else {

            self.mainWindowController = MainWindowController.instantiate()

            if let window = NSApplication.shared.mainWindow {

                window.windowController = self.mainWindowController
            }

            if isRetry == false {

                openMainWindow(isRetry: true)
            }

            return
        }

        if let mainViewController = mainWindowController.contentViewController as? MainViewController {

            mainViewController.store = store
        }

        if let window = mainWindowController.window {

            window.center()
            window.makeKeyAndOrderFront(self)
        }
    }
}

extension AppCoordinator {

    fileprivate func fetchAllTimezones() {

        let allTimeZones: [TimeZone] = TimeZone.all
            .sorted { $0.secondsFromGMT() < $1.secondsFromGMT() }

        store.dispatch(AppAction.fetchedAllTimezones(timezones: allTimeZones))
    }

    fileprivate func fetchAllCountries() {

        let allCountries = NSLocale.allCountriesLocalized

        store.dispatch(AppAction.fetchedAllCountries(countries: allCountries))
    }

    fileprivate func fetchSavedTimezones() {

        let timezones = userDefaults.timezones()

        store.dispatch(AppAction.fetchedSavedTimezones(timezones: timezones))
    }

    fileprivate func fetchLaunchAtLogin() {

        store.dispatch(AppAction.fetchLaunchAtLogin())
    }
}

extension AppCoordinator: PopOverCoordinatorDelegate {

    func selectSettings() {

        openMainWindow()
    }
}

extension AppCoordinator: StoreSubscriber {

    func newState(state: AppState) {

        if state.timezoneState.timezones.count > 0 {

            userDefaults.save(state.timezoneState.timezones)
        }

        popOverCoordinator.state = state.timezoneState
    }
}
