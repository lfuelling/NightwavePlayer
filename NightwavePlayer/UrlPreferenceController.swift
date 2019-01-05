//
//  UrlPreferenceController.swift
//  NightwavePlayer
//
//  Created by Lerk on 05/01/2019.
//  Copyright © 2019 Lukas Fülling. All rights reserved.
//

import Cocoa

class UrlController: NSObject {
    
    @IBOutlet weak var menuController: StatusMenuController!
    
    @IBOutlet weak var mp3128Item: NSMenuItem!
    @IBOutlet weak var mp396Item: NSMenuItem!
    @IBOutlet weak var opus96Item: NSMenuItem!
    @IBOutlet weak var opus64Item: NSMenuItem!
    @IBOutlet weak var vorbis96Item: NSMenuItem!
    @IBOutlet weak var vorbis64Item: NSMenuItem!
    
    @IBAction func mp3128Clicked(sender: NSMenuItem) {
        menuController.updatePlayerUrl(playerUrl: "https://radio.plaza.one/mp3")
        setEnabled(item: mp3128Item)
    }
    
    @IBAction func mp396Clicked(sender: NSMenuItem) {
        menuController.updatePlayerUrl(playerUrl: "https://radio.plaza.one/mp3_96")
        setEnabled(item: mp396Item)
    }
    
    @IBAction func opus96Clicked(sender: NSMenuItem) {
        menuController.updatePlayerUrl(playerUrl: "https://radio.plaza.one/opus")
        setEnabled(item: opus96Item)
    }
    
    @IBAction func opus64Clicked(sender: NSMenuItem) {
        menuController.updatePlayerUrl(playerUrl: "https://radio.plaza.one/opus_64")
        setEnabled(item: opus64Item)
    }
    
    @IBAction func vorbis96Clicked(sender: NSMenuItem) {
        menuController.updatePlayerUrl(playerUrl: "https://radio.plaza.one/ogg")
        setEnabled(item: vorbis96Item)
    }
    
    @IBAction func vorbis64Clicked(sender: NSMenuItem) {
        menuController.updatePlayerUrl(playerUrl: "https://radio.plaza.one/ogg_64")
        setEnabled(item: vorbis64Item)
    }
    
    func setEnabled(item: NSMenuItem) {
        mp3128Item.state = (mp3128Item.isEqual(to: item) ? NSControl.StateValue.on : NSControl.StateValue.off);
        mp396Item.state = (mp396Item.isEqual(to: item) ? NSControl.StateValue.on : NSControl.StateValue.off);
        opus96Item.state = (opus96Item.isEqual(to: item) ? NSControl.StateValue.on : NSControl.StateValue.off);
        opus64Item.state = (opus64Item.isEqual(to: item) ? NSControl.StateValue.on : NSControl.StateValue.off);
        vorbis96Item.state = (vorbis96Item.isEqual(to: item) ? NSControl.StateValue.on : NSControl.StateValue.off);
        vorbis64Item.state = (vorbis64Item.isEqual(to: item) ? NSControl.StateValue.on : NSControl.StateValue.off);
    }
}
