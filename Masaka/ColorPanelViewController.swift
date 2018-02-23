//
//  ColorPanelViewController.swift
//  Masaka
//
//  Created by Jay Wong on 2/23/18.
//  Copyright © 2018 Jay Wong. All rights reserved.
//

import Cocoa

// This class controls the NSColorPanel view
class ColorPanelViewController: NSViewController {
    
    var colorPanel = NSColorPanel.shared

    override func loadView() {
        self.colorPanel.showsAlpha = true
        self.colorPanel.mode = .wheel
        self.view = self.colorPanel.contentView!
        self.colorPanel.contentView!.frame = NSMakeRect(0, 0, view.frame.width, view.frame.height)
        self.colorPanel.contentView!.autoresizingMask = [.width, .height]
    }
    
}
