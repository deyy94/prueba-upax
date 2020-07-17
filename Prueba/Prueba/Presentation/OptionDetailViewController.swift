//
//  OptionDetailViewController.swift
//  Prueba
//
//  Created by David Guillermo Robles Sánchez on 16/07/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit
class OptionDetailTableViewCell: UITableViewCell {
}

class OptionDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let presenter = OptionsDetailPresenter()
    let datePicker = UIDatePicker()
    var pickerView:UIPickerView = UIPickerView()
    let toolbar = UIToolbar()
    let sexoData = ["Masculino", "Femenino"]
    
    var optionsReceived = [Options]()
    
    var optionsSelected = [Options]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        datePicker.datePickerMode = .date
        
        toolbar.sizeToFit()
        presenter.attachView(view: self)
        presenter.getOptions(option: optionsReceived)
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension OptionDetailViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexoData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return sexoData[row]
        
    }
    
    
}
extension OptionDetailViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsSelected.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionDetailCell", for: indexPath)
        
        
        if optionsSelected[indexPath.row].name == "Foto"
        {
            
            let image = getImage()
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: cell.frame.size.width-50, height: 300)
            
            cell.addSubview(imageView)
            
        }else if optionsSelected[indexPath.row].name == "Camara"
        {
            let image = getImage()
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            
            cell.addSubview(imageView)
        }else
            if optionsSelected[indexPath.row].name == "Nombre completo"
            {
                let nameTexfield =  UITextField(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width-50, height: 40))
                nameTexfield.placeholder = "Escribe tu nombre completo"
                nameTexfield.font = UIFont.systemFont(ofSize: 15)
                nameTexfield.borderStyle = UITextField.BorderStyle.roundedRect
                nameTexfield.autocorrectionType = UITextAutocorrectionType.no
                nameTexfield.keyboardType = UIKeyboardType.default
                nameTexfield.returnKeyType = UIReturnKeyType.done
                nameTexfield.clearButtonMode = UITextField.ViewMode.whileEditing
                nameTexfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                
                
                cell.addSubview(nameTexfield)
            }else if optionsSelected[indexPath.row].name == "Número telefónico"
            {
                let nameTexfield =  UITextField(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width-50, height: 40))
                nameTexfield.placeholder = "Escribe tu Número telefónico"
                nameTexfield.font = UIFont.systemFont(ofSize: 15)
                nameTexfield.borderStyle = UITextField.BorderStyle.roundedRect
                nameTexfield.autocorrectionType = UITextAutocorrectionType.no
                nameTexfield.keyboardType = UIKeyboardType.decimalPad
                nameTexfield.returnKeyType = UIReturnKeyType.done
                nameTexfield.clearButtonMode = UITextField.ViewMode.whileEditing
                nameTexfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                
                
                cell.addSubview(nameTexfield)
            }else if optionsSelected[indexPath.row].name == "Fecha de nacimiento"
            {
                let dateField =  UITextField(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width-50, height: 40))
                dateField.placeholder = "Escribe tu Fecha de nacimiento"
                dateField.font = UIFont.systemFont(ofSize: 15)
                dateField.borderStyle = UITextField.BorderStyle.roundedRect
                dateField.autocorrectionType = UITextAutocorrectionType.no
                dateField.keyboardType = UIKeyboardType.decimalPad
                dateField.returnKeyType = UIReturnKeyType.done
                dateField.clearButtonMode = UITextField.ViewMode.whileEditing
                dateField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                dateField.inputAccessoryView = toolbar
                dateField.inputView = datePicker
                
                cell.addSubview(dateField)
            }else if optionsSelected[indexPath.row].name == "Sexo"
            {
                let numberField =  UITextField(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width-50, height: 40))
                numberField.placeholder = "Sexo"
                numberField.font = UIFont.systemFont(ofSize: 15)
                numberField.borderStyle = UITextField.BorderStyle.roundedRect
                numberField.autocorrectionType = UITextAutocorrectionType.no
                numberField.keyboardType = UIKeyboardType.decimalPad
                numberField.returnKeyType = UIReturnKeyType.done
                numberField.clearButtonMode = UITextField.ViewMode.whileEditing
                numberField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                numberField.inputView = pickerView
                
                cell.addSubview(numberField)
                
            }else if optionsSelected[indexPath.row].name == "Color favorito"
            {
                let a = LevelView(frame: CGRect(x: 0, y: 0, width: 64, height: 32), level: 0.75, color: UIColor.green)
                let b = LevelView(frame: CGRect(x: 20, y: 0, width: 64, height: 32), level: 0.75, color: UIColor.gray)
                let c = LevelView(frame: CGRect(x: 40, y: 0, width: 64, height: 32), level: 0.75, color: UIColor.blue)
                let d = LevelView(frame: CGRect(x: 60, y: 0, width: 64, height: 32), level: 0.75, color: UIColor.yellow)
                
                
                
                
                cell.addSubview(a)
                cell.addSubview(b)
                cell.addSubview(c)
                cell.addSubview(d)
        }
        
        return cell
    }
    
    
}
extension OptionDetailViewController: OptionsDetailView
{
    func setOptions(options: [Options]) {
        optionsSelected = options
        tableView?.delegate = self
        tableView?.allowsMultipleSelection = true
        tableView?.reloadData()
    }
    
    func getImage() -> UIImage
    {
        let url = URL(string: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg")
        let data = try? Data(contentsOf: url!)
        
        let image = UIImage(data: data!)
    
        return image!
        
    }
    
    
    
    
    
}
class LevelView : UIView {
    
    init(frame: CGRect, level: CGFloat, color: UIColor) {
        super.init(frame: frame)
        self.layer.borderWidth = 1.0
        let levelLayer = CAShapeLayer()
        levelLayer.path = UIBezierPath(roundedRect: CGRect(x: frame.origin.x,
                                                           y: frame.origin.y,
                                                           width: frame.width * level,
                                                           height: frame.height),
                                       cornerRadius: 0).cgPath
        levelLayer.fillColor = color.cgColor
        self.layer.addSublayer(levelLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Required, but Will not be called in a Playground")
    }
}

