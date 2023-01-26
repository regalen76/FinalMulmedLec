//
//  BeforePlayViewController.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import UIKit

class BeforePlayViewController:
    UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var waitView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var questionData : ToDo?
    var viewModel = QuestionViewModel()
    var questions = [ToDo]()
    
    var maxLength:Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        waitView.isHidden = true
        nameTextField.delegate = self
        
        fetchData()
    }
    
    func fetchData(){
        waitView.isHidden = false
        spinner.startAnimating()
        viewModel.getOneQuestion { [weak self] in
            self?.questions.append(contentsOf: (self?.viewModel.questionModel)!)
        
            self?.questionData = (self?.questions[0])!
            DispatchQueue.main.async {
                self?.spinner.stopAnimating()
                self?.waitView.isHidden = true
            }
        }
    }
    
    @IBAction func startGame(_ sender: Any) {
        if (nameTextField!.text!.isEmpty){
            
        }else{
            performSegue(withIdentifier: "playSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playSegue"{
            let firstPlay = segue.destination as? FirstPlayViewController
            
            firstPlay?.questionData = questionData
            firstPlay?.playerName = nameTextField.text!
        }
    }
    
    //Agar textfield length 4 max
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        if textField == nameTextField{
            maxLength = 4
        }
        
        let currentString : NSString = textField.text! as NSString
        
        let newString : NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= maxLength
    }


}

