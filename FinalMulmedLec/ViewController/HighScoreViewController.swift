//
//  HighScoreViewController.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import UIKit
import CoreData

class HighScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var scoreViewModel = AllScoreViewModel()
    var scoreList = [Allscore]()
    var firstLoad = true
    
    @IBOutlet weak var scoreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(firstLoad){
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            scoreList = scoreViewModel.getScore(context: context)
            
            //cuma tampilin top 20
            for (index,_) in scoreList.enumerated(){
                print(index)
                if(index > 20){
                    scoreList.remove(at: index)
                }
            }
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "unwindToHome", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID", for: indexPath) as! ScoreCell
        
        //sort bedasarkan score
        scoreList = scoreList.sorted { (Int(truncating: $0.playerScore) ) > (Int(truncating: $1.playerScore) ) }
        
        let thisScore = scoreList[indexPath.row]

        tableViewCell.nameLabel.text = thisScore.playerName
        tableViewCell.scoreLabel.text = "\(String(describing: thisScore.playerScore!))"
        
        return tableViewCell
    }
}
