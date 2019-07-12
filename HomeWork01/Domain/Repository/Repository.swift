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
//    var contacts: [Contact] { get }
    func getContacts(completion: @escaping ([Contact]) -> ())

}

final class RemoteFactory: RepositoryFactory {
//    var contacts: [Contact] {
//        var contactList = [Contact]()
//        getContacts(completion: {
//            contactList = $0
//        })
//        return contactList
//    }

    private let dispatchGroup = DispatchGroup()
    private let dispatchQueue = DispatchQueue.init(label: "com.keepcoding", attributes: .concurrent)
    
}

extension RemoteFactory {
    func getContacts(completion: @escaping ([Contact]) -> ()) {
        
        let stringUrl = "https://jsonplaceholder.typicode.com/users"

        self.dispatchGroup.enter()
        self.dispatchQueue.async {
            var contacts = [Contact]()
            
            let sessionConfig = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: sessionConfig)
            
            let url = URL(string: stringUrl)
            
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
