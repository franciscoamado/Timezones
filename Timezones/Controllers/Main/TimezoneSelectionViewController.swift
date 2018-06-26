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

    func renderItems(with timezones: [String]?) {

        guard let timezones = timezones, timezones.count > 0 else {

            stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
            store?.dispatch(AppAction.addedSelection(timezone: "GMT"))
            return
        }

        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        timezones.forEach { self.addNewSelection(timezone: $0) }
    }

    func addNewSelection(timezone: String? = nil) {

        let selectionButton = TimezoneSelectionButton()

        selectionButton.removeAllItems()
        selectionButton.addItems(withTitles: store?.state.allTimezones ?? [])
        stackView.addArrangedSubview(selectionButton)
        selectionButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
    }
}

// MARK: - Actions
extension TimezoneSelectionViewController {

    @IBAction func addTimezone(_ sender: Any) {

        store?.dispatch(AppAction.addedSelection(timezone: "GMT"))
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

        print("\(#file) newState")
        renderItems(with: store?.state.timezoneState.timezones)
    }
}
