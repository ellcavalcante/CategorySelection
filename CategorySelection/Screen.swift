//
//  Screen.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 20/09/23.
//

import UIKit

class Screen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundColor() {
        backgroundColor = .purple
    }
    
}
