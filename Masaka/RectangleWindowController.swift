//
//  RectangleWindowController.swift
//  Masaka
//
//  Created by Jay Wong on 2/16/18.
//  Copyright © 2018 Jay Wong. All rights reserved.
//

import Cocoa

class RectangleWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        // Customize our window
        // Remove title bar from the beginning, but allow users to resize the window
        self.window!.styleMask = .resizable
        self.window!.hasShadow = false
        self.window!.level = .floating
        self.window!.canHide = true
        
        // Set background color to transparent, so give all the control to view
        self.window!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        self.window!.isMovableByWindowBackground = true
    }
    
    override func mouseDown(with event: NSEvent) {
        // Open color panel if user double clicks
        if event.clickCount == 2 {
            print("window got 2!")
        }
    }
}
