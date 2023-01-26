//
//  FirstPlayViewController.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import UIKit

class FirstPlayViewController: UIViewController {

    var playerName: String = ""
    var questionData : ToDo?
    var viewModel = QuestionViewModel()
    var questions = [ToDo]()
    var score: Int = 0
    var questionNum: Int = 1
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerABtn: UIButton!
    @IBOutlet weak var answerBBtn: UIButton!
    @IBOutlet weak var answerCBtn: UIButton!
    @IBOutlet weak var answerDBtn: UIButton!
    @IBOutlet weak var answerEBtn: UIButton!
    @IBOutlet weak var answerFBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "SCORE: \(score)"
        questionLabel.text = "No.\(questionNum): \(questionData!.question!)"
        
        if ((questionData?.answers.answer_a?.isEmpty) != nil){
            answerABtn.setTitle(questionData!.answers.answer_a, for: .normal)
        }else{
            answerABtn.isHidden = true
        }
        if ((questionData?.answers.answer_b?.isEmpty) != nil){
            answerBBtn.setTitle(questionData!.answers.answer_b, for: .normal)
        }else{
            answerBBtn.isHidden = true
        }
        if ((questionData?.answers.answer_c?.isEmpty) != nil){
            answerCBtn.setTitle(questionData!.answers.answer_c, for: .normal)
        }else{
            answerCBtn.isHidden = true
        }
        if ((questionData?.answers.answer_d?.isEmpty) != nil){
            answerDBtn.setTitle(questionData!.answers.answer_d, for: .normal)
        }else{
            answerDBtn.isHidden = true
        }
        if ((questionData?.answers.answer_e?.isEmpty) != nil){
            answerEBtn.setTitle(questionData!.answers.answer_e, for: .normal)
        }else{
            answerEBtn.isHidden = true
        }
        if ((questionData?.answers.answer_f?.isEmpty) != nil){
            answerFBtn.setTitle(questionData!.answers.answer_f, for: .normal)
        }else{
            answerFBtn.isHidden = true
        }

    }
    
    @IBAction func answerA(_ sender: Any) {
        if(questionData?.correct_answers.answer_a_correct == "true"){
            score += 25
            questionNum += 1
            performSegue(withIdentifier: "prepareSegue", sender: self)
        }else{
            performSegue(withIdentifier: "gameOverSegue", sender: self)
        }
    }
    
    @IBAction func answerB(_ sender: Any) {
        if(questionData?.correct_answers.answer_b_correct == "true"){
            score += 25
            questionNum += 1
            performSegue(withIdentifier: "prepareSegue", sender: self)
        }else{
            performSegue(withIdentifier: "gameOverSegue", sender: self)
        }
    }
    
    @IBAction func answerC(_ sender: Any) {
        if(questionData?.correct_answers.answer_c_correct == "true"){
            score += 25
            questionNum += 1
            performSegue(withIdentifier: "prepareSegue", sender: self)
        }else{
            performSegue(withIdentifier: "gameOverSegue", sender: self)
        }
    }
    
    @IBAction func answerD(_ sender: Any) {
        if(questionData?.correct_answers.answer_d_correct == "true"){
            score += 25
            questionNum += 1
            performSegue(withIdentifier: "prepareSegue", sender: self)
        }else{
            performSegue(withIdentifier: "gameOverSegue", sender: self)
        }
    }
    
    @IBAction func answerE(_ sender: Any) {
        if(questionData?.correct_answers.answer_e_correct == "true"){
            score += 25
            questionNum += 1
            performSegue(withIdentifier: "prepareSegue", sender: self)
        }else{
            performSegue(withIdentifier: "gameOverSegue", sender: self)
        }
    }
    
    @IBAction func answerF(_ sender: Any) {
        if(questionData?.correct_answers.answer_f_correct == "true"){
            score += 25
            questionNum += 1
            performSegue(withIdentifier: "prepareSegue", sender: self)
        }else{
            performSegue(withIdentifier: "gameOverSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "prepareSegue"{
            let preparation = segue.destination as? PreparingViewController
            
            preparation?.playerName = playerName
            preparation?.score = score
            preparation?.questionNum = questionNum
        }else if segue.identifier == "gameOverSegue"{
            let preparation = segue.destination as? GameOverViewController
            
            preparation?.playerName = playerName
            preparation?.score = score
        }
    }
    
    @IBAction func unwindToPlay(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
//        // Use data from the view controller which initiated the unwind segue
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

