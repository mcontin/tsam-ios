//
//  ViewController.swift
//  LessonCoreData
//
//  Created by Mattia Contin  on 08/06/2017.
//  Copyright © 2017 Mattia Contin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var people: [String] = []
    //    var name: String? = nil
    @IBOutlet weak var peopleTable: UITableView!
    
    let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let managedContext = self.container.viewContext
        let persons: [Person]
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        
        do {
            persons = try managedContext.fetch(fetchRequest)
            people = persons.map({ person in
                return person.name ?? ""
            })
        } catch {
            print(error)
        }
    }
    
    @IBAction func addPerson(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Insert a person", message: "Add a person!", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "add", style: UIAlertActionStyle.default, handler: { action in
            print("added")
            
            if let name = alert.textFields?[0].text {
                self.people.append(name)
                self.peopleTable.reloadData()
                
                let context = self.container.viewContext
                let person: Person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
                
                person.name = name
                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        })
        
        let cancel = UIAlertAction(title: "cancel", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("deleting")
            let removed = self.people.remove(at: indexPath.row)
            self.peopleTable.deleteRows(at: [indexPath], with: .fade)
            
            let context = container.viewContext
            let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
            let predicate = NSPredicate(format: "name contains[c] %@", removed)
            
            fetchRequest.predicate = predicate
            do {
                let p = try context.fetch(fetchRequest)
                context.delete(p.first!)
            } catch {
                
            }
       }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        print("edit requested")
        
        return nil
    }
}

