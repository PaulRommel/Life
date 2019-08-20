//
//  InnerLifeViewController.swift
//  Life
//
//  Created by Павел Попов on 11/06/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class InnerLifeViewController: UIViewController {

    private var actualPicker = String()
    // массив с данными для наполнения Picker View
    private let dataSource = ["Fear of Relationships", "Fear of Being Alone", "Fear of Losing Identity", "Fear of Change", "Fear of Necessity to Overcome Something", "Fear of Freedom", "Fear of Life", "Fear of Death"]

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .done, target: self, action: #selector(self.action(sender:)))

        // Do any additional setup after loading the view.
    }
    @objc func action(sender: UIBarButtonItem) {
        
        switch actualPicker {
            case "Fear of Relationships":
                 let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                 let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfRelationships") as! FearOfRelationshipsViewController
                 self.navigationController?.pushViewController(newViewController, animated: true)
            case "Fear of Being Alone":
                 let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                 let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfBeingAlone") as! FearOfBeingAloneViewController
                 self.navigationController?.pushViewController(newViewController, animated: true)
            case "Fear of Losing Identity":
                 let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                 let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfLosingIdentity") as! FearOfLosingIdentityViewController
                 self.navigationController?.pushViewController(newViewController, animated: true)
            case "Fear of Change":
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfChange") as! FearOfChangeViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            case "Fear of Necessity to Overcome Something":
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfNecessityToOvercomeSomething") as! FearOfNecessityToOvercomeSomethingViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            case "Fear of Freedom":
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfFreedom") as! FearOfFreedomViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            case "Fear of Life":
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfLife") as! FearOfLifeViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            case "Fear of Death":
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FearOfDeath") as! FearOfDeathViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            default:
            print("Picker not selected")
        }
        
        // получаем номер выбранной строки в Picker View
        let actualRow = self.pickerView.selectedRow(inComponent: 0)
        // по строке получаем выбранное значение
        let actualValue = dataSource[actualRow]
        // выводим результат на консоль
        print ("Вы выбрали строку \(actualRow) со значением \(actualValue)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension InnerLifeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // возвращает количество компонентов в элементе Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // возвращает количество элементов в компоненте в Picker View
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // оно соответсвует количеству элементов в массиве dataSource
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // выбор компонента
        actualPicker = dataSource[row]
        //dataLabel.text = dataSource[row]
    }
    // оно соответствует значению соответсвующего элемента в массиве
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // оно соответствует значению соответсвующего элемента в массиве
        return dataSource[row]
    }

}
