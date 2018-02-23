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
        // Send message back to update color
        self.colorPanelViewController.colorPanel.setTarget(self)
        self.colorPanelViewController.colorPanel.setAction(#selector(self.updateColor))
        
        // init popover
        self.popover.delegate = self
        self.popover.contentViewController = self.colorPanelViewController
        self.popover.behavior = .semitransient
    }
    
    override func mouseDown(with event: NSEvent) {
        // Close the popover when user single clicks
        if self.popover.isShown {
            self.popover.close()
        }
        
        // Open the popover if user double clicks
        if event.clickCount == 2 {
            self.activatePopover()
        }
    }
    
    // Update the view color based on the selected color in color panel
    @objc private func updateColor(_ sender: NSColorPanel) {
        self.view.layer!.backgroundColor = sender.color.cgColor
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
