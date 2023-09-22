//
//  SearchViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 21/09/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    var screen: SearchScreen?
    
    override func loadView() {
        screen = SearchScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension SearchViewController: SearchScreenProtocol {
    func actionCleanButton() {
        print(#function)
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
