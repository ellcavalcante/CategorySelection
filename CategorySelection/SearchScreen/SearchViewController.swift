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
        screen?.configTextFieldDelegate(delegate: self)
        settings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func settings() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let tapBrandView = UITapGestureRecognizer(target: self, action: #selector(brandViewTapped))
        screen?.brandView.addGestureRecognizer(tapBrandView)
        
        let tapEngineView = UITapGestureRecognizer(target: self, action: #selector(engineViewTapped))
        screen?.engineView.addGestureRecognizer(tapEngineView)
        
        let tapYearView = UITapGestureRecognizer(target: self, action: #selector(yearViewTapped))
        screen?.yearView.addGestureRecognizer(tapYearView)
        
        let tapColorView = UITapGestureRecognizer(target: self, action: #selector(colorViewTapped))
        screen?.colorView.addGestureRecognizer(tapColorView)
    }
    
    @objc func brandViewTapped() {
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.brandTitleLabel.text ?? "")
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func engineViewTapped() {
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.engineTitleLabel.text ?? "")
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func yearViewTapped() {
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.yearTitleLabel.text ?? "")
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func colorViewTapped() {
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.colorTitleLabel.text ?? "")
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SearchViewController: SearchScreenProtocol {
    func actionFilterButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func actionCleanButton() {
        print(#function)
//        screen?.typeSomethingTextField.becomeFirstResponder()
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
