//
//  SerachData.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 15/11/23.
//

import Foundation

struct SearchData: Codable {
    var search: String
    var advanced: AdvancedData
}

struct AdvancedData: Codable {
    var brand: [Int]
    var engine: [String]
    var year: [String]
    var color: [String]
}
