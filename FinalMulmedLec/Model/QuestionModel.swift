//
//  QuestionModel.swift
//  FinalMulmedLec
//
//  Created by Reonaldo Galen Maliode on 26/01/23.
//

import Foundation

struct ToDo: Decodable {
    let id: Int?
    let question: String?
    let description: String?
    let answers: MyAnswers
    let correct_answers: MyCorrectAnswers
    let explanation: String?
}

struct MyAnswers: Decodable {
    let answer_a: String?
    let answer_b: String?
    let answer_c: String?
    let answer_d: String?
    let answer_e: String?
    let answer_f: String?
}

struct MyCorrectAnswers: Decodable {
    let answer_a_correct: String?
    let answer_b_correct: String?
    let answer_c_correct: String?
    let answer_d_correct: String?
    let answer_e_correct: String?
    let answer_f_correct: String?
}
