//
//  ViewController.swift
//  Prueba
//
//  Created by David Guillermo Robles Sánchez on 16/07/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
   
}

class OptionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let presenter = OptionsPresenter()
    var options = [Options]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
    }


}
extension OptionssViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as! OptionsTableViewCell
        let data = options[indexPath.row]
      
        return cell
    }
    
    
}

