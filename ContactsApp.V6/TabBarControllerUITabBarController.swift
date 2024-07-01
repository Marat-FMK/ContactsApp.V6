//
//  TabBarControllerUITabBarController.swift
//  ContactsApp.V6
//
//  Created by Marat Fakhrizhanov on 30.06.2024.
//

import UIKit

class TabBarControllerUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setControllers()
    }
    
    private func setControllers() {
        
        let persons: [Person] = Person.getPerson()
        guard let personVC = viewControllers?.first as? PersonsListTableViewController else { return }
        guard let shortInfoVC = viewControllers?.last as? ShortInfoTableViewController else { return }
         
        personVC.persons = persons
        shortInfoVC.persons = persons
    }
}
