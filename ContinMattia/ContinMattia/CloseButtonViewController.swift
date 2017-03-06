//
//  CloseButtonViewController.swift
//  ContinMattia
//
//  Created by Mattia Contin  on 02/03/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit

class CloseButtonViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClosePressed() {
        dismiss(animated: true, completion: nil)
    }

}
