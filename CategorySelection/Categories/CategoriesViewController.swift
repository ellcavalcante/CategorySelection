//
//  CategoriesViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 22/09/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var screen: CategoriesScreen?
    
    override func loadView() {
        screen = CategoriesScreen()
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

extension CategoriesViewController: CategoriesScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionCleanButton() {
        print(#function)
    }
    
    func actionFilterButton() {
        print(#function)
    }
    
    
}
