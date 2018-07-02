//
//  TimezoneSelectionViewController.swift
//  Timezones
//
//  Created by Francisco Amado on 23/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa
import ReSwift

class TimezoneSelectionViewController: NSViewController, NibLoadable {

    @IBOutlet weak var stackView: NSStackView!

    var store: AppStore?

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    override func viewWillAppear() {

        super.viewWillAppear()
        store?.subscribe(self)
    }

    override func viewWillDisappear() {

        super.viewWillDisappear()
        store?.unsubscribe(self)
    }

    func renderItems(with timezones: [TimeZone]?) {

        guard let timezones = timezones, timezones.count > 0 else {

            stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

            if let defaultTimeZone = TimeZone.GMT {

                store?.dispatch(AppAction.addedSelection(timezone: defaultTimeZone))
            }
            return
        }

        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for (index, timezone) in timezones.enumerated() {
            addNewSelection(timezone: timezone, with: index)
        }
    }

    func addNewSelection(timezone: TimeZone? = nil, with index: Int) {

        guard let allTimezones = store?.state.allTimezones else { return }

        let selectionButton = TimezonePopUpButton(timezones: allTimezones, selected: timezone)
        selectionButton.delegate = self
        selectionButton.tag = index
        
        stackView.addArrangedSubview(selectionButton)
        selectionButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    }
}

extension TimezoneSelectionViewController: TimezonePopUpButtonDelegate {

    func didFinishSelection(button: TimezonePopUpButton, selected: TimeZone?) {

        guard let selected = selected else { return }

        store?.dispatch(AppAction.selected(index: button.tag, timezone: selected))
    }
}

// MARK: - Actions
extension TimezoneSelectionViewController {

    @IBAction func addTimezone(_ sender: Any) {

        guard stackView.arrangedSubviews.count < 10 else {

            NSSound.beep()
            return
        }

        if let defaultTimezone = TimeZone.GMT {

            store?.dispatch(AppAction.addedSelection(timezone: defaultTimezone))
        }
    }

    @IBAction func removeTimezone(_ sender: Any) {

        guard stackView.arrangedSubviews.count > 1 else {

            NSSound.beep()
            return
        }

        store?.dispatch(AppAction.removedSelection())
    }
}

extension TimezoneSelectionViewController: StoreSubscriber {

    func newState(state: AppState) {

        renderItems(with: store?.state.timezoneState.timezones)
    }
}
