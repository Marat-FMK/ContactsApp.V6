//
//  Person.swift
//  ContactsApp.V6
//
//  Created by Marat Fakhrizhanov on 30.06.2024.
//

import Foundation

struct Person {
    
    let name: String
    var surname: String
    let email: String
    let phone: String
    var image: String
    var fullName: String {
        "\(name) \(surname)"
    }
    
   static func getPerson() -> [Person] {
        
        var persons: [Person] = []
        
        var names = DataManager.anyContact.names.shuffled()
        var surnames = DataManager.anyContact.surnames.shuffled()
        var emails = DataManager.anyContact.emails.shuffled()
        var phones = DataManager.anyContact.phones.shuffled()
        
       if names.contains("Marat")||surnames.contains("FMK"){
           let person = Person(name: "Marat", surname: "FMK", email: emails.randomElement() ?? "", phone: phones.randomElement() ?? "", image: "Person VIP")
           persons.append(person)
          names = names.filter{ $0 != person.name}
          surnames = surnames.filter{ $0 != person.surname}
       }
       for _ in 1...names.count {
            
            let person: Person = Person(
                name: names.randomElement() ?? "",
                surname: surnames.randomElement() ?? "",
                email: emails.randomElement() ?? "",
                phone: phones.randomElement() ?? "",
            image: "personImage")
           
            persons.append(person)
            
            if names.contains(person.name) || surnames.contains(person.surname)||emails.contains(person.email)||phones.contains(person.phone) {
                names = names.filter{ $0 != person.name}
                surnames = surnames.filter{ $0 != person.surname}
                emails = emails.filter{$0 != person.email}
                phones = phones.filter { $0 != person.phone}
            }
        }
        return persons
    }
}
