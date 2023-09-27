//
//  CategoriesViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 22/09/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var screen: CategoriesScreen?
    
    var titleLabel: String
    
    init(titleLabel: String) {
        
        self.titleLabel = titleLabel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = CategoriesScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.titleLabel.text = titleLabel
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
