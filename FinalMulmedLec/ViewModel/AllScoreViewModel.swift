//
//  AllScoreViewModel.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import Foundation
import CoreData

class AllScoreViewModel{
    
    var AllScoreModel = [Allscore]()
    
    func addScore(context: NSManagedObjectContext, name: String, score: Int){
        let entity = NSEntityDescription.entity(forEntityName: "Allscore", in: context)
        let newScore = Allscore(entity: entity!, insertInto: context)
        newScore.playerName = name
        newScore.playerScore = score as NSNumber
        do{
            try context.save()
        }catch{
            print("context save error")
        }
    }
    
    func getScore(context: NSManagedObjectContext) -> [Allscore]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Allscore")
        do{
            let results:NSArray = try context.fetch(request) as NSArray
            for result in results {
                let score = result as! Allscore
                AllScoreModel.append(score)
            }
        }catch{
            print("Fetch Failed")
        }
        return AllScoreModel
    }
}
