//
//  RectangleWindowController.swift
//  Masaka
//
//  Created by Jay Wong on 2/16/18.
//  Copyright © 2018 Jay Wong. All rights reserved.
//

import Cocoa

class RectangleWindowController: NSWindowController, NSWindowDelegate {
    
    let userDefaults = UserDefaults.standard

    override func windowDidLoad() {
        super.windowDidLoad()
        // Customize our window
        // Remove title bar from the beginning, but allow users to resize the window
        self.window!.styleMask = .resizable
        self.window!.hasShadow = false
        self.window!.level = .floating
        self.window!.canHide = true
        
        // Use the user default to setup the initial window size
        var dummyFrame = self.window!.frame
        let width = userDefaults.float(forKey: "width")
        let height = userDefaults.float(forKey: "height")
        let originX = userDefaults.float(forKey: "origin_x")
        let originY = userDefaults.float(forKey: "origin_y")
        
        // Recover size
        if width != 0.0 && height != 0.0 {
            dummyFrame.size = CGSize(width: CGFloat(width), height: CGFloat(height))
            self.window!.setFrame(dummyFrame, display: false)
        }
        
        // Recover position
        print(originX)
        if originX != 0.0 && height != 0.0 {
            dummyFrame.origin = CGPoint(x: CGFloat(originX), y: CGFloat(originY))
            self.window!.setFrame(dummyFrame, display: false)
        }
        
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
    
    // Memorize the new size
    func windowDidResize(_ notification: Notification) {
        print("resized!")
        userDefaults.set(self.window?.frame.width, forKey: "width")
        userDefaults.set(self.window?.frame.height, forKey: "height")
        print(userDefaults.float(forKey: "width"))
    }
    
    // Memorize the new origin
    func windowDidMove(_ notification: Notification) {
        userDefaults.set(self.window?.frame.origin.x, forKey: "origin_x")
        userDefaults.set(self.window?.frame.origin.y, forKey: "origin_y")
    }
}
