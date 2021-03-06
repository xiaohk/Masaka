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
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init color panel view controller
        self.colorPanelViewController.loadView()
        // Send message back to update color
        self.colorPanelViewController.colorPanel.setTarget(self)
        self.colorPanelViewController.colorPanel.setAction(#selector(self.updateColor))
        
        // init popover
        self.popover.delegate = self
        self.popover.contentSize = NSSize(width: 200, height: 300)
        self.popover.contentViewController = self.colorPanelViewController
        self.popover.behavior = .semitransient
    }
    
    override func mouseDown(with event: NSEvent) {
        // Close the popover when user single clicks
        if self.popover.isShown {
            self.deactivatePopover()
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
    
    // Deactivate the shown popover
    private func deactivatePopover() {
        // Store the final color to user default so we can recover it next time
        // We have to store the color in NSColor format, since CGColor doesn't comfort
        // the NSCoding protocol
        let finalColor = self.colorPanelViewController.colorPanel.color
        let colorData = NSKeyedArchiver.archivedData(withRootObject: finalColor)
        userDefaults.set(colorData, forKey: "backgroundColor")
        
        // Close the popover window
        self.popover.close()
    }
}
