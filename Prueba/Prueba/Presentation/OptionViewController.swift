//
//  ViewController.swift
//  Prueba
//
//  Created by David Guillermo Robles Sánchez on 16/07/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
   
}

class OptionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let presenter = OptionsPresenter()
    var options = [Options]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView?.dataSource = self
        
        
        presenter.attachView(view: self)
        presenter.getOptions()
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    
}
extension OptionsViewController: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as! OptionTableViewCell
        let data = options[indexPath.row]
        cell.title?.text = data.name
        
        return cell
    }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if options[indexPath.row].check == false{
        options[indexPath.row].check = true
    }

    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if options[indexPath.row].check == true
        {
            options[indexPath.row].check = false
        }
    }
    
    
    
}

extension OptionsViewController: OptionsView
{
    func showAlert(mensaje: String) {
        let alert = UIAlertController(title: "Atencion", message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showDetailOptions(_ sender: UIButton) {
        if options.contains(where: {opcion in opcion.check == true})
        {
            let optionsFilter = options.filter {$0.check == true}
            let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "detailOptions") as! OptionDetailViewController
            VC1.optionsReceived = optionsFilter
        self.navigationController!.pushViewController(VC1, animated: true)
        }else
        {
            showAlert(mensaje: "Debes seleccionar al menos una opcion")
        }
    }

    func setFooter() -> UIView {
        let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: Double(self.tableView.frame.size.width-100), height: 45))
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: buttonView.frame.size.width , height: buttonView.frame.size.height)
        button.backgroundColor = .clear
        button.setTitle("Siguiente", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.center = buttonView.center
        button.addTarget(self, action: #selector(showDetailOptions(_:)), for: .touchUpInside)
        buttonView.addSubview(button)
        buttonView.bringSubviewToFront(button)
        buttonView.center = self.view.center
        
        return buttonView
    }
    
    
    
    func setOptions(options: [Options]) {
        self.options = options
        tableView?.delegate = self
        tableView?.tableFooterView = setFooter()
        tableView?.allowsMultipleSelection = true
        tableView?.sectionFooterHeight = 45
        
        tableView?.reloadData()
       
        
    }
    
    
}

