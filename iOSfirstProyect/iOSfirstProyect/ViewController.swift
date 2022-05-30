//
//  ViewController.swift
//  iOSfirstProyect
//
//  Created by desarrollador11 on 26/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var mySecondButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var myPageController: UIPageControl!
    @IBOutlet weak var mySegmentedController: UISegmentedControl!
    @IBOutlet weak var mySwitchButton: UISwitch!
    @IBOutlet weak var myTextField: UITextField!
    
    // variables
    private let myPickerViewValues: [String] = [
    "one", "two", "three", "four","five", "six", "seven", "eight"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstLabel.text="My app Name"
        firstLabel.adjustsFontSizeToFitWidth = true
        firstLabel.minimumScaleFactor = 0.2
        firstLabel.numberOfLines = 1 // or 1
        firstLabel.textColor=UIColor(red: 0.3, green: 0.99, blue: 0.9, alpha: 1)
        //firstLabel.textColor=UIColor.black
        mySecondButton.setTitle("Boton Agregado", for: .normal)
        mySecondButton.backgroundColor = .green
        mySecondButton.setTitleColor(.blue, for: .normal)
        pickerView.backgroundColor = .cyan
        pickerView.sizeThatFits(CGSize(width: 20, height: 30))
        pickerView.sizeToFit()
        print(pickerView.frame.width)
        print(pickerView.frame.height)
        // dataSource is used to get data
        pickerView.dataSource = self
        // delegate is use to notify the action done inside
        // the pickerview
        pickerView.delegate = self
        
        // to mypagecontroller
        myPageController.numberOfPages = myPickerViewValues.count
        myPageController.currentPageIndicatorTintColor = .purple
        myPageController.pageIndicatorTintColor = .systemGray4
        
        // to segmented controller
        mySegmentedController.removeAllSegments() // clean the default data
        for (index, value) in myPickerViewValues.enumerated(){
            mySegmentedController.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        // textField
        //myTextField.text = "this is my console"
        //myTextField.insertText("this is my console 2")
        // the placeHolder works as a hintText inside the textfield
        myTextField.placeholder = "this is my console"
        myTextField.backgroundColor = .magenta
        myTextField.font = UIFont.boldSystemFont(ofSize: 17)
        
        // switch button
        mySwitchButton.tintColor = .red
        //mySwitchButton.backgroundColor = .blue
        //mySwitchButton.thumbTintColor = .yellow
        mySwitchButton.onTintColor = .purple
    }
    
    
    @IBAction func changeTextButton(_ sender: Any) {
        if (firstLabel.text=="My app Name"){
            firstLabel.text="this title must be soooo long to know how its working"
        } else{
            firstLabel.text="My app Name"
        }
    }
    
    @IBAction func MyButtonAction(_ sender: Any) {
        if mySecondButton.backgroundColor == .green {
            mySecondButton.backgroundColor = .purple
        } else{
            mySecondButton.backgroundColor = UIColor.green
        }
    }
    
    @IBAction func myPageControllerAction(_ sender: Any) {
        pickerView.selectRow(myPageController.currentPage, inComponent: 0, animated: true)
            let isSlected = myPickerViewValues[myPageController.currentPage]
            mySecondButton.setTitle(isSlected, for: .normal)
    }
    
    @IBAction func mySegmentedController(_ sender: Any) {
        pickerView.selectRow(mySegmentedController.selectedSegmentIndex, inComponent: 0, animated: true)
        myPageController.currentPage = mySegmentedController.selectedSegmentIndex
    }
    
    @IBAction func myTextFieldAction(_ sender: Any) {
        
    }
    @IBAction func mySwitchController(_ sender: Any) {
        if mySwitchButton.isOn{
            firstLabel.isHidden = false
        }
        else {
            firstLabel.isHidden = true
        }
        
    }
    
}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print("nuevas medida")
        print(pickerView.frame.width)
        print(pickerView.frame.height)
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let isSlected = myPickerViewValues[row]
        mySecondButton.setTitle(isSlected, for: .normal)
        myPageController.currentPage = row
    }
}

