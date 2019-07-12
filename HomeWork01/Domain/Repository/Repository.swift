//
//  Repository.swift
//  HomeWork01
//
//  Created by Santiago Sanchez merino on 12/07/2019.
//  Copyright © 2019 Santiago Sanchez Merino. All rights reserved.
//

import Foundation

final class Repository {
    static let factory = RemoteFactory()
}

protocol RepositoryFactory {
    var contacts: [Contact] { get }
}

final class RemoteFactory: RepositoryFactory {
    let dispatchGroup = DispatchGroup()
    let dispatchQueue = DispatchQueue.init(label: "com.keepcoding", attributes: .concurrent)
    
    var contacts: [Contact] {
        
        var tempContacts = [Contact]()
        let stringUrl = "https://jsonplaceholder.typicode.com/users"
        
        getContacts(from: stringUrl) { contacts in
            tempContacts = contacts
        }

        dispatchGroup.notify(queue: dispatchQueue) {
            print("Todas las tareas ASYNC finalizadas")
            dump(tempContacts)
            print(tempContacts.count)
        }

        return tempContacts
    }
    
}

extension RemoteFactory {
    func getContacts(from urlString: String, completion: @escaping ([Contact]) -> ()) {
        
        self.dispatchGroup.enter()
        self.dispatchQueue.async {
            var contacts = [Contact]()
            
            let sessionConfig = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: sessionConfig)
            
            let url = URL(string: urlString)
            
            let task = urlSession.dataTask(with: url!) { data, response, error in
                if let contactData = data {
                    let dictArray = try! JSONSerialization.jsonObject(with: contactData, options: []) as! [[String : Any]]
                    for dict in dictArray {
                        let contact = Contact(dict: dict)
                        contacts.append(contact)
                    }
                }
                completion(contacts)
                self.dispatchGroup.leave()
            }
            
            task.resume()
        }
    }
}
