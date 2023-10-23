//
//  ItensModel.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 27/09/23.
//

import UIKit

struct ItemModel {
    var name: String
    var id: Int?

}

extension ItemModel: Equatable {
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        return lhs.id == rhs.id
    }
}
