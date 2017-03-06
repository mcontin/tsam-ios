//
//  ViewController.swift
//  SwiftUrlConnection
//
//  Created by Mattia Contin  on 28/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")
        
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        self.view.addSubview(spinner)
        spinner.startAnimating()
        
        spinner.hidesWhenStopped = true;
        spinner.center = view.center;
        
        
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            spinner.stopAnimating()
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            
            print(json)
        }
        
        task.resume()
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

