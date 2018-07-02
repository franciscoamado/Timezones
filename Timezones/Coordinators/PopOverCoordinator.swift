//
//  PopOverCoordinator.swift
//  Timezones
//
//  Created by Francisco Amado on 16/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Foundation
import Cocoa

protocol PopOverCoordinatorDelegate: class {

    func selectSettings()
}

class PopOverCoordinator {

    let viewController: PopOverViewController?

    weak var delegate: PopOverCoordinatorDelegate?

    var state: TimezoneState {
        didSet {
            viewController?.state = state
        }
    }

    init(state: TimezoneState, delegate: PopOverCoordinatorDelegate? = nil) {

        self.state = state
        viewController = PopOverViewController.instantiate()
        viewController?.coordinator = self
        viewController?.state = state
    }
}

extension PopOverCoordinator {

    struct State {

        var timezones: [String]
    }
}

extension PopOverCoordinator: PopOverCoordinatorDelegate {

    func selectSettings() {

        delegate?.selectSettings()
    }
}
