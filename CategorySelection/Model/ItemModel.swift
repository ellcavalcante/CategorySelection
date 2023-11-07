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
    
    init(name: String) {
        self.name = name
        self.id = 0
        self.modelos = []
    }
    
    init(name: String, id: Int, modelos: [Modelos]) {
        self.name = name
        self.id = id
        self.modelos = modelos
    }
}

struct Modelos {
    var id: Int
    var name: String
    var releaseYear: Int
    var engine: String
    
}

extension ItemModel: Equatable {
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        return lhs.id == rhs.id
    }
}
