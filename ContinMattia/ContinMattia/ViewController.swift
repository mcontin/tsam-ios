//
//  ViewController.swift
//  ContinMattia
//
//  Created by Mattia Contin  on 02/03/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

protocol ColorChangerDelegate {
    func onColorSelected(color: UIColor)
}

import UIKit

class ViewController: UIViewController, ColorChangerDelegate {

    @IBOutlet weak var pushButton: UIButton!
    @IBOutlet weak var modalButton: UIButton!
    
    var pushColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let minSize = min(self.view.bounds.width, self.view.bounds.height)
        modalButton.frame.size.width = 1 / 3 * minSize
        modalButton.frame.size.height = 1 / 3 * minSize
        modalButton.layer.cornerRadius = 0.5 * modalButton.bounds.size.width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(pushColor != nil) {
            pushButton.backgroundColor = pushColor!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "coloringSegue") {
            let next = segue.destination as! ColoredButtonsViewController
            next.delegate = self
        }
    }
    
    func onColorSelected(color: UIColor) {
        pushColor = color
    }

}

