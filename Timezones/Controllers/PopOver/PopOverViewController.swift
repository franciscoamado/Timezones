//
//  PopOverViewController.swift
//  Timezones
//
//  Created by Francisco Amado on 15/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

class PopOverViewController: NSViewController, NibLoadable {

    @IBOutlet weak var stackView: NSStackView!

    weak var coordinator: PopOverCoordinatorDelegate?

    var state: TimezoneState? {
        didSet {
            configure(list: state?.timezones)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func selectSettings(_ sender: Any) {
        coordinator?.selectSettings()
    }
}

protocol PopOverItem {

    var title: String { get }
}

// MARK: - Configuration
extension PopOverViewController {

    fileprivate func configure(list: [String]?) {

        guard let list = list, list.count > 0 else { return }

        print(stackView.arrangedSubviews)

        for _ in list {

            if let infoView = TimezoneInfoView.instantiate() {
                stackView.addArrangedSubview(infoView)
            }
        }
    }
}
