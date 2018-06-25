//
//  TimezoneSelectionViewController.swift
//  Timezones
//
//  Created by Francisco Amado on 23/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa
import TinyConstraints

class TimezoneSelectionViewController: NSViewController {

    @IBOutlet weak var stackView: NSStackView!

    override func viewDidLoad() {

        super.viewDidLoad()
        addNewSelection()
    }

    func addNewSelection() {

        let allTimeZones = TimeZone.all.compactMap { timezone -> String in

            return timezone.formatted
        }

        let selectionButton = TimezoneSelectionButton()

        selectionButton.removeAllItems()
        selectionButton.addItems(withTitles: allTimeZones)
        stackView.addArrangedSubview(selectionButton)
        selectionButton.centerX(to: stackView)
    }
}

// MARK: - Actions
extension TimezoneSelectionViewController {

    @IBAction func addTimezone(_ sender: Any) {

        addNewSelection()
    }
}
