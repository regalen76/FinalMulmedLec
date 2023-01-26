//
//  QuestionViewModel.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import Foundation

class QuestionViewModel {
    private var sourceURL: String = "https://quizapi.io/api/v1/questions/?limit=1"
    var questionModel = [ToDo]()
    
    func getOneQuestion(completion: @escaping () ->()) {
        
        let request = NSMutableURLRequest(url: NSURL(string: sourceURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.addValue("vJeNZTQ65NEGzEtPcStGnswRm0IYsQf5te6BzKcu", forHTTPHeaderField: "X-Api-Key")
        
        let session = URLSession.shared
        session.dataTask(with: request as URLRequest) { [weak self] (data, response, error) in
            if let data = data{
                let jsonDecoder = JSONDecoder()
                let result = try! jsonDecoder.decode([ToDo].self, from: data)
                print(result)
                self?.questionModel = result
                completion()
            }
        }.resume()
    }
}
