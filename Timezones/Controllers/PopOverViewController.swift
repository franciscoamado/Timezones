//
//  PopOverViewController.swift
//  Timezones
//
//  Created by Francisco Amado on 15/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

class PopOverViewController: NSViewController {

    @IBOutlet weak var stackView: NSStackView!

    weak var coordinator: PopOverCoordinatorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// ViewController instantiation from Storyboard
    static func instantiate() -> PopOverViewController {

        return .init(nibName: "PopOverViewController", bundle: Bundle.main)
    }

    @IBAction func selectSettings(_ sender: Any) {
        self.coordinator?.selectSettings()
    }
}
