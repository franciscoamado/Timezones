//
//  ViewController.swift
//  Timezones
//
//  Created by Francisco Amado on 13/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    @IBOutlet weak var containerView: NSView!
    @IBOutlet weak var locationSelectionButton: NSPopUpButton!
    @IBOutlet weak var startAtLoginButton: NSButton!
    
    fileprivate var state: MainState? {
        didSet {
            configureLocationButton(with: state?.selectedCountryName)
            configureStartAtLoginButton(with: state?.startAtLogin)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureLocationButton()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

// MARK: - State
extension MainViewController {

    struct MainState {

        var selectedCountryName: String
        var selectedCountryIdentifier: String
        var startAtLogin: Bool
    }

    func configure(_ state: MainState? = nil) {

        self.state = state
    }
}

// MARK: - Configuration
extension MainViewController {

    fileprivate func configureLocationButton(with selectedCountry: String? = nil) {

        let countries = NSLocale.allCountriesLocalized
        locationSelectionButton.removeAllItems()
        locationSelectionButton.addItems(withTitles: countries)

        if let selectedCountry = selectedCountry {

            locationSelectionButton.selectItem(withTitle: selectedCountry)
        }
    }

    fileprivate func configureStartAtLoginButton(with value: Bool? = nil) {

        if let value = value {

            startAtLoginButton.state = value ? .on : .off
        }
    }
}

// MARK: - Actions
extension MainViewController {

    @IBAction func didPressQuit(_ sender: Any) {

        NSApplication.shared.terminate(sender)
    }

    @IBAction func didSelectStartAtLogin(_ sender: Any) {

        guard let button = sender as? NSButton else {

            assertionFailure("didSelectStartAtLogin sender isn't a NSButton")
            return
        }

        print("button.state \(button.state == .on)")
    }

    @IBAction func didChangeLocation(_ sender: Any) {

        guard let button = sender as? NSPopUpButton else {

            assertionFailure("didChangeLocation sender isn't a NSPopUpButton")
            return
        }

        state?.selectedCountryName = button.titleOfSelectedItem ?? ""
    }
}

