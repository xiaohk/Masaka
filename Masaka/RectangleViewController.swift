//
//  RectangleViewController.swift
//  Masaka
//
//  Created by Jay Wong on 2/16/18.
//  Copyright © 2018 Jay Wong. All rights reserved.
//

import Cocoa

class RectangleViewController: NSViewController, NSPopoverDelegate {
    
    var colorPanelViewController = ColorPanelViewController()
    let popover = NSPopover()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init color panel view controller
        self.colorPanelViewController.loadView()
        
        // init popover
        self.popover.delegate = self
        self.popover.contentViewController = self.colorPanelViewController
        self.popover.behavior = .semitransient
    }
    
    override func mouseDown(with event: NSEvent) {
        self.view.layer!.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        self.view.setNeedsDisplay(self.view.frame)
        
        // Close the popover when user single clicks
        if self.popover.isShown {
            self.popover.close()
        }
        
        // Open color panel if user double clicks
        if event.clickCount == 2 {
            print("Double clicked!")
            self.activatePopover()
        }
    }
    
    // Popover the color panel
    private func activatePopover() {
        self.colorPanelViewController.colorPanel.color =
            NSColor(cgColor: self.view.layer!.backgroundColor!)!
        self.popover.show(relativeTo: self.view.bounds,
                          of: self.view,
                          preferredEdge: .maxX)
    }

}

