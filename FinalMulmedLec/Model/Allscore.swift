//
//  Allscore.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import CoreData

@objc(Allscore)
class Allscore: NSManagedObject{
    @NSManaged var playerScore: NSNumber!
    @NSManaged var playerName: String!
}
