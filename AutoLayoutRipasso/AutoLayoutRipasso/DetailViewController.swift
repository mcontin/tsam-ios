//
//  DetailViewController.swift
//  AutoLayoutRipasso
//
//  Created by Mattia Contin  on 01/03/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit

protocol asd {
    
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var data: UITextField!
    
    var mData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        data.text = mData
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func set(someData: String) {
        self.mData = someData
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
