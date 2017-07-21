//
//  ViewController.swift
//  LessonChatMQTT
//
//  Created by Mattia Contin  on 09/06/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit
import SwiftMQTT

class ViewController: UIViewController {
    
    var mqttSession: MQTTSession? = nil
    var connected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mqttSession = MQTTSession(host: "broker.mqttdashboard.com", port: 1883, clientID: "swift", cleanSession: true, keepAlive: 15, useSSL: false)
        
        mqttSession?.connect { (succeeded, error) -> Void in
            self.connected = succeeded
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func send(_ sender: Any) {
        let jsonDict = "de̡̝̰̭͕͔̪͉r҉̰͙̯̱̩̭.̜̹̺̗c̼̯̲̥̟̘h҉͕a̼̖̰̙̱̥̤͐̿͒̌͡ò̥͓͔ͮͧs̝̞͉̖̭l̨̝̫͓̗̰̻̓̀ͩ͆ͧ̍ĭ̢̝̖͖̣̳ͦ̂̈́ͅņ̆ͥͣg̭̞̙̍̊́̔̑ͧ̚ ̵̼ͤ͑ͨ̒o̗͂ͨ̔̌ͣ͋f̱͐̽ͪ̚ ̱̳̣̻̥̒c͌ͬ̏ͣ̐҉̘̰͉̻͉̤ĥ̒ͣ̈́ẳ̠̄ó͍̪̪̟̺̪̳ͤ̈́ͦ̔͑͒s̹̬ͭ̃̆͑ͦ̆̓̀.̵͎̳̯̟͉̜ͨ̑̊W͑̃͛̃̌i̬̼͍̝͓̙ͧ̒ͫ̃̑tͬͧͩ̉ͪ̑҉̦h̦̦̠̤̜̻͛̑ͦͧͩͣ ͉̀̀ͫo̟͊ͪ͡u̲̪͓̙͎̬̽̒t̲͇͈͘ ̗͈̪̣̰̂́ͭ̑͒ͯõ̩̥̦ͭ̈̾ͣ̌̚r̬̞̗͕̘̳ͯ̉͊ͯͤͣ͝d̸̬̣̳̤̰̣̥͌̑̇͐̆̅̋"
        let data = jsonDict.data(using: .utf8)
        
        mqttSession?.publish(data!, in: "Its_Ios", delivering: .atLeastOnce, retain: false) { (succeeded, error) -> Void in
            if succeeded {
                print("Published!")
            }
        }
    }

}

