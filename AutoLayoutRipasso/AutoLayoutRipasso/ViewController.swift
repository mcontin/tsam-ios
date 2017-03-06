//
//  ViewController.swift
//  AutoLayoutRipasso
//
//  Created by Mattia Contin  on 01/03/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, asd {

    @IBOutlet weak var myTableView: UITableView!
    var list: [String] = []
    
    func initList() {
        list.append("primo")
        list.append("secondo")
        list.append("terzo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table view settings
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.text = list[indexPath.row] + "sottotitolo"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailSegue") {
            let index = myTableView.indexPathForSelectedRow
            let next = segue.destination as! DetailViewController
            next.set(someData: list[(index?.row)!])
        }
    }
}

