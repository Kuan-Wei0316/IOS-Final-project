//
//  Cafe.swift
//  IOS Final project
//
//  Created by User11 on 2022/12/26.
//

import Foundation

struct CafeResult: Codable {
    let data: [Cafe]
}

struct Cafe: Codable {
    let name: String
    let city: String
//    let cheap: Double
//    let address: String
//    let wifi: Double
//    let socket: String
//    let open_time: String
//    let limited_time: String
//    let url: String?
}
