//
//  HomeViewController.swift
//  HomeWork01
//
//  Created by Santiago Sanchez merino on 12/07/2019.
//  Copyright © 2019 Santiago Sanchez Merino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var model: [Contact]?
    let cellId = "ContactCell"
    @IBOutlet weak var tableView: UITableView!
    
    init() {
        self.model = [Contact]()
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        Repository.factory.getContacts(completion: {
            self.model = $0
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self

    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = self.model?[indexPath.row].name
        cell.detailTextLabel?.text = self.model?[indexPath.row].email
        
        return cell
    }
    
}
