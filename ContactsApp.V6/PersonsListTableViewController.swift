//
//  PersonsListTableViewController.swift
//  ContactsApp.V6
//
//  Created by Marat Fakhrizhanov on 30.06.2024.
//

import UIKit

class PersonsListTableViewController: UITableViewController {
    
    
    var persons : [Person]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 40
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            
        let person = persons[indexPath.row]
            
            content.text = person.fullName
            content.image = UIImage(named: person.image)
            content.imageProperties.cornerRadius = tableView.rowHeight / 2
            
            cell.contentConfiguration = content
            
            return cell
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showInfo" {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                let person = persons[indexPath.row]
                let aboutVC = segue.destination as! AboutContactViewController
                aboutVC.person = person
            }
        }
    
   

}
