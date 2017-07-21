//
//  ViewController.swift
//  TestingApplication
//
//  Created by Mattia Contin  on 29/03/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://www.liguriaoggi.it/wp-content/uploads/2015/02/apple-logo.jpg")
        imageView.kf.setImage(with: url, options: [.transition(.fade(2))])
    }

    // Alerts must be shown in viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
//        showAlert(withTitle: "first", message: "FIRST ALERT")
//        showAlert(withTitle: "second", message: "SECOND ALERT")
//        showAlert(withTitle: "third", message: "THIRD ALERT")
    }
    
    fileprivate func showAlert(withTitle title: String, message: String, action: @escaping ((UIAlertAction) -> Void) = {_ in }) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: action))
        self.present(alert, animated: true, completion: nil)
    }
}

