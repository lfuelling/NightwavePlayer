//
//  StatusMenuController.swift
//  NightwavePlaza
//
//  Created by Lerk on 04/01/2019.
//  Copyright © 2019 Lerk. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    let PREFERENCE_KEY = "nightwavePlayer.audioUrl"
    
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var playMenuItem: NSMenuItem!
    @IBOutlet weak var urlPreferenceWindow: NSWindow!
    @IBOutlet weak var playerUrl: NSTextField!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let nightwavePlayer = NightwavePlayer()
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        statusItem.button?.image = icon
        statusItem.menu = statusMenu
        if (UserDefaults.standard.object(forKey: PREFERENCE_KEY) != nil) {
            nightwavePlayer.audioUrl = UserDefaults.standard.object(forKey: PREFERENCE_KEY) as! String;
        }
    }
    
    @IBAction func savePlayerUrl(sender: NSButton) {
        urlPreferenceWindow.setAccessibilityFocusedWindow(false)
        urlPreferenceWindow.close()
        nightwavePlayer.audioUrl = playerUrl.stringValue
        UserDefaults.standard.set(nightwavePlayer.audioUrl, forKey: PREFERENCE_KEY)
        if(nightwavePlayer.playing) { // restert running stream when changing url
            nightwavePlayer.stopAudio()
            nightwavePlayer.startAudio()
        }
    }
    
    @IBAction func showUrlPreferenceWindow(sender: NSMenuItem) {
        urlPreferenceWindow.setIsVisible(true)
        urlPreferenceWindow.setAccessibilityFocusedWindow(true)
        playerUrl.stringValue = nightwavePlayer.audioUrl
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    @IBAction func togglePlay(sender: NSMenuItem) {
        if(nightwavePlayer.playing) {
            playMenuItem.title = "Play"
            nightwavePlayer.stopAudio()
        } else {
            playMenuItem.title = "Stop"
            nightwavePlayer.startAudio()
        }
    }
}
