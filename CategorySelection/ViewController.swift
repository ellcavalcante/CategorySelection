//
//  ViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 20/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: Screen?
    
    override func loadView() {
        screen = Screen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

