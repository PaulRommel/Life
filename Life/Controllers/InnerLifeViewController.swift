//
//  InnerLifeViewController.swift
//  Life
//
//  Created by Павел Попов on 11/06/2019.
//  Copyright © 2019 Yopi Studio. All rights reserved.
//

import UIKit

class InnerLifeViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    // массив с данными для наполнения Picker View и выставляем кастомное значение
    private var actualPicker = "Fear of Relationships"
    private let dataSource = ["Fear of Relationships", "Fear of Being Alone", "Fear of Losing Identity", "Fear of Change", "Fear of Necessity to Overcome Something", "Fear of Freedom", "Fear of Life", "Fear of Death"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Next", style: .done, target: self, action: #selector(self.action(sender:)))
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    @objc func action(sender: UIBarButtonItem) {
        var questionable: Questionable?
        switch actualPicker {
            case "Fear of Relationships":
                questionable = QuestionFactory.getQuestionable(for: "Fear of Relationships")
            case "Fear of Being Alone":
                print("Picker not selected")
            case "Fear of Losing Identity":
                print("Picker not selected")
            case "Fear of Change":
                print("Picker not selected")
            case "Fear of Necessity to Overcome Something":
                print("Picker not selected")
            case "Fear of Freedom":
                print("Picker not selected")
            case "Fear of Life":
                print("Picker not selected")
            case "Fear of Death":
                print("Picker not selected")
            default:
                print("Picker not selected")
        }
        
        guard let isQuestionable = questionable else { return }

        let newViewController = QuestionnaireController.instantiate(with: isQuestionable)
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        // получаем номер выбранной строки в Picker View
        let actualRow = self.pickerView.selectedRow(inComponent: 0)
        // по строке получаем выбранное значение
        let actualValue = dataSource[actualRow]
        // выводим результат на консоль
        print ("Вы выбрали строку \(actualRow) со значением \(actualValue)")
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
