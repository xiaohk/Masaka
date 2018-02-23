//
//  RectangleView.swift
//  Masaka
//
//  Created by Jay Wong on 2/22/18.
//  Copyright © 2018 Jay Wong. All rights reserved.
//

import Cocoa

class RectangleView: NSView {
    
    let userDefaults = UserDefaults.standard
    
    @IBAction func quitMenuItemTapped(sender: NSMenuItem!) {
        NSApplication.shared.terminate(self)
    }
    
    override func awakeFromNib() {
        self.wantsLayer = true
        // Use last time user config as the initial background color
        var defaultColor: NSColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        if let colorData = userDefaults.object(forKey: "backgroundColor") as? Data{
            defaultColor = NSKeyedUnarchiver.unarchiveObject(with: colorData) as! NSColor
        }
        self.layer!.backgroundColor = defaultColor.cgColor
        
        // Change the size of view when user resizes the window
        self.autoresizingMask = [.width, .height]
    }
    
}
