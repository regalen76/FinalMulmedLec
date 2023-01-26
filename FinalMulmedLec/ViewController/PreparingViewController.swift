//
//  PreparingViewController.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import UIKit

class PreparingViewController: UIViewController {

    @IBOutlet weak var progresView: UIProgressView!
    
    var questionData : ToDo?
    var viewModel = QuestionViewModel()
    var questions = [ToDo]()
    var score: Int = 0
    var questionNum: Int = 1
    var playerName: String = ""
    
    var timer = Timer()
    
    var completedBar: Bool = false
    var performedSegue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData { [weak self] in
            if self?.performedSegue == false{
                self?.performedSegue = true
                DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: "backToPlaySegue", sender: self)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToPlaySegue"{
            let firstPlay = segue.destination as? FirstPlayViewController
            
            firstPlay?.questionData = questionData
            firstPlay?.questionNum = questionNum
            firstPlay?.score = score
            firstPlay?.playerName = playerName
        }
    }
    
    func fetchData(completion: @escaping () ->()){
        var progress: Float = 0.0
        progresView.progress = progress
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (timer) in
            progress += 0.01
            self.progresView.progress = progress
            
            if self.progresView.progress == 1.0{
                completion()
            }
        })
        
        viewModel.getOneQuestion { [weak self] in
            
            self?.questions.append(contentsOf: (self?.viewModel.questionModel)!)
        
            self?.questionData = (self?.questions[0])!
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
