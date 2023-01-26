//
//  ViewController.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    
    var viewModel = QuestionViewModel()
    var questions = [ToDo]()
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func moveToPlay(_ sender: Any) {
        performSegue(withIdentifier: "playSegue", sender: self)
    }
    
    @IBAction func moveToScore(_ sender: Any) {
        performSegue(withIdentifier: "scoreSegue", sender: self)
    }
    
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
//        // Use data from the view controller which initiated the unwind segue
    }
    
}
