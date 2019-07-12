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
    @IBOutlet weak var tableView: UITableView!
    
    init() {
        self.model = Repository.factory.contacts
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
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
        return UITableViewCell()
    }
    
}
