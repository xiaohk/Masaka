//
//  RectangleView.swift
//  Masaka
//
//  Created by Jay Wong on 2/22/18.
//  Copyright © 2018 Jay Wong. All rights reserved.
//

import Cocoa

class RectangleView: NSView {
    
    @IBAction func quitMenuItemTapped(sender: NSMenuItem!){
        exit(0)
    }
    
    override func awakeFromNib() {
        self.wantsLayer = true
        self.layer!.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        // Change the size of view when user resizes the window
        self.autoresizingMask = [.width, .height]
    }
    
}
