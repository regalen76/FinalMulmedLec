//
//  GameOverViewController.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import UIKit
import CoreData

class GameOverViewController: UIViewController {

    var playerName: String = ""
    var score: Int = 0
    
    var scoreViewModel = AllScoreViewModel()
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(playerName) - \(score)"
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        scoreViewModel.addScore(context: context, name: playerName, score: score)
        performSegue(withIdentifier: "unwindToHome", sender: self)
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
