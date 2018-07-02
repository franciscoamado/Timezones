//
//  MainWindowController.swift
//  Timezones
//
//  Created by Francisco Amado on 18/06/2018.
//  Copyright © 2018 franciscoamado. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    static func instantiate() -> MainWindowController? {

        let storyboard = NSStoryboard(name: "Main", bundle: Bundle.main)

        let windowController = storyboard.instantiateController(withIdentifier: "MainWindowController") as? MainWindowController

        return windowController
    }
}
