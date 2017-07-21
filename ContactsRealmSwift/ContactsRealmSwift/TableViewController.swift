//
//  TableViewController.swift
//  RealmSwift
//
//  Created by Mattia Contin  on 22/02/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var contacts: [Contact] = [];
    var realm: Realm? = nil;
    var contactsFromDb: Results<Contact>? = nil;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the default Realm
        realm = try! Realm()
        
        let personOne = Person(id: "0")
        
        let dogOne = Dog(id: "0", name: "a")
        let dogTwo = Dog(id: "1", name: "b")
        let dogThree = Dog(id: "2", name: "c")
        
        personOne.dogs.append(dogOne)
        personOne.dogs.append(dogTwo)
        personOne.dogs.append(dogThree)
        
        try! realm?.write {
            realm?.add(personOne)
        }
        
        debugPrint(realm?.objects(Dog.self))
        
        // You only need to do this once (per thread)
        /*
        contactsFromDb = (realm?.objects(Contact.self))! // retrieves all Dogs from the default Realm
        
        if((contactsFromDb?.count)! <= 0) {
            initDb()
        } else {
            print("Records found in the database: ");
            for contact in contactsFromDb! {
                print(contact);
                contacts.append(contact);
            }
        }
         */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("appeared")
        tableView.reloadData()
    }
    
    func initDb() {
        print("Initializing database")
        
        let mario = Contact(withName: "Mario", surname: "Rossi", andAge: 32)
        let michele = Contact(withName: "Michele", surname: "Bravo", andAge: 21)
        let mattia = Contact(withName: "Mattia", surname: "Asd", andAge: 18)
        let federico = Contact(withName: "Fede", surname: "Llalala", andAge: 41)
        let carlo = Contact(withName: "Carlo", surname: "Lodododdo", andAge: 28)
        
        contacts += [mario, michele, mattia, federico, carlo]
        
        // Add to the Realm inside a transaction
        for contact in contacts {
            try! realm?.write {
                realm?.add(contact)
            }
        }
        
        print("Database initialized")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (contactsFromDb?.count)!;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = contactsFromDb?[indexPath.row].simpleDescription();
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            realm?.beginWrite()
            realm?.delete((contactsFromDb?[indexPath.row])!)
            try! realm?.commitWrite()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
