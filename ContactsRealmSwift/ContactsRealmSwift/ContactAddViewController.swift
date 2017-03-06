//
//  ContactAddViewController.swift
//  ContactsRealmSwift
//
//  Created by Mattia Contin  on 27/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit
import RealmSwift

class ContactAddViewController: UIViewController {

    @IBOutlet weak var inputAge: UITextField!
    @IBOutlet weak var inputSurname: UITextField!
    @IBOutlet weak var inputName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onConfirm() {
        let newContact = Contact(withName: inputName.text!, surname: inputSurname.text!, andAge: Int(inputAge.text!)!)
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newContact)
        }
        
        _ = navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
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
