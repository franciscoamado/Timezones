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

    let viewController: PopOverViewController

    weak var delegate: PopOverCoordinatorDelegate?

    init(with delegate: PopOverCoordinatorDelegate? = nil) {

        self.viewController = PopOverViewController.instantiate()
        self.viewController.coordinator = self
    }
}

extension PopOverCoordinator: PopOverCoordinatorDelegate {

    func selectSettings() {

        self.delegate?.selectSettings()
    }
}
