//
//  AppDelegate.swift
//  Masaka
//
//  Created by Jay Wong on 2/16/18.
//  Copyright © 2018 Jay Wong. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var menu: NSMenu!
    
    @IBAction func quitMenuItemTapped(_ sender: NSMenuItem) {
        NSApp.terminate(self)
    }
    
    // Add status item using the standard length
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Display the menu bar button
        let button = self.statusItem.button
        
        // No need to switch Status bar icon based on the user menu bar style
        // The imageset is set as template image, so it changes automatically
        button?.image = #imageLiteral(resourceName: "StatusBarButton")
        self.statusItem.menu = self.menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

