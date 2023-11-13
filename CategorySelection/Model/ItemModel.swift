//
//  ItensModel.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 27/09/23.
//

import UIKit

struct ItemModel {
    var name: String
    var id: Int
    var modelos: [Modelos]
    
}
struct Modelos {
    var id: Int
    var name: String
    var releaseYear: Int
    var engine: String
    
}
