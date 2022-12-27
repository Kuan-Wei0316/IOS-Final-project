//
//  Poem.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/27.
//

import Foundation

struct PoemResult: Codable {
    let data: [Poem]
}

struct Poem: Identifiable, Codable {
    let id=UUID()
    var type : String
    var poem : String
    var explain : String
    var note : String?
//    var reslut : PoemResultData?
    
    
}
//struct PoemResultData: Codable {
//    var 願望 : String?
//}
