//
//  ViewController.swift
//  iON Live Stream
//
//  Created by Tanner Hoke on 6/16/15.
//  Copyright © 2015 Hoke. All rights reserved.
//

import Cocoa
import ImageIO

class ViewController: NSViewController {

    @IBOutlet weak var liveStreamImageView: NSImageView!
    @IBOutlet weak var errorMsg: NSTextField!
    
    var timer: NSTimer!
    var n = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("reloadImage"), userInfo: nil, repeats: true)
        
        errorMsg.alphaValue = 1.0
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: - Live :)
    
    @objc func reloadImage() {
        let queue = dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
        dispatch_async(queue) {
            let imageData = NSData(contentsOfURL: NSURL(string: "http://192.168.1.2:8080/?action=snapshot&n=\(self.n++)")!)
            dispatch_async(dispatch_get_main_queue()) {
                if let imageData = imageData {
                    self.liveStreamImageView.image = NSImage(data: imageData)
                }
            }
        }
        
        if liveStreamImageView.image == nil {
            errorMsg.alphaValue = 1.0
        } else {
            errorMsg.alphaValue = 0.0
        }
    }

}

