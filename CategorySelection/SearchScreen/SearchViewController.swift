//
//  SearchViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 21/09/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    var screen: SearchScreen?
    var brandSelectedItems: [ItemModel] = []
    var colorSelectedItems: [ItemModel] = []
    
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
        let arrayToPass: [ItemModel] = [ItemModel(name: "Toyota", id: 1),
                                         ItemModel(name: "Ford", id: 2),
                                         ItemModel(name: "Volkswagen", id: 3),
                                         ItemModel(name: "Honda", id: 4)]
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.brandTitleLabel.text ?? "", dataArray: arrayToPass, rowsItems: brandSelectedItems, selectedItems: brandSelectedItems)
        screenCategories.delegate = self
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    
    @objc func engineViewTapped() {
        if screen?.brandLabel.attributedText?.string != "Filtrar por marca" {
            let arrayToPass: [EngineModel] = []
            //            let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.engineTitleLabel.text ?? "", dataArray: arrayToPass)
            //            screenCategories.delegate = self
            //            self.navigationController?.pushViewController(screenCategories, animated: true)
        }
    }
    
    @objc func yearViewTapped() {
        if screen?.brandLabel.attributedText?.string != "Filtrar por marca" {
            let arrayToPass: [YearModel] = []
            //            let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.yearTitleLabel.text ?? "", dataArray: arrayToPass)
            //            screenCategories.delegate = self
            //            self.navigationController?.pushViewController(screenCategories, animated: true)
        }
    }
    
    @objc func colorViewTapped() {
        let arrayColorToPass: [ItemModel] = [ItemModel(name: "Branco", id: 1),
                                             ItemModel(name: "Preto", id: 2),
                                             ItemModel(name: "Prata", id: 3),
                                             ItemModel(name: "Cinza", id: 4),
                                             ItemModel(name: "Azul", id: 5),
                                             ItemModel(name: "Vermelho", id: 6),
                                             ItemModel(name: "Verde", id: 7),
                                             ItemModel(name: "Amarelo", id: 8),
                                             ItemModel(name: "Laranja", id: 9),
                                             ItemModel(name: "Marrom", id: 10)]
                let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.colorTitleLabel.text ?? "", dataArray: arrayColorToPass, rowsItems: colorSelectedItems, selectedItems: colorSelectedItems)
                screenCategories.delegate = self
                self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SearchViewController: CategoriesViewControllerDelegate {
    
    func didSelectItems(_ selectedItems: [ItemModel], forCategory category: String) {
        
        if category == screen?.brandTitleLabel.text {
            let selectedItemsText = selectedItems.map { $0.name }.joined(separator: "\n\n")
            screen?.brandLabel.text = selectedItemsText
            screen?.brandLabel.textColor = UIColor.black
            screen?.pencilBrandButton.isHidden = false
            brandSelectedItems = selectedItems
        } else if category == screen?.engineTitleLabel.text {
            let selectedItemsText = selectedItems.map { $0.name }.joined(separator: "\n\n")
            screen?.engineLabel.text = selectedItemsText
            screen?.engineLabel.textColor = UIColor.black
            screen?.pencilEngineButton.isHidden = false
        } else if category == screen?.yearTitleLabel.text {
            let selectedItemsText = selectedItems.map { $0.name }.joined(separator: "\n\n")
            screen?.yearLabel.text = selectedItemsText
            screen?.yearLabel.textColor = UIColor.black
            screen?.pencilYearButton.isHidden = false
        } else {
            let selectedItemsText = selectedItems.map { $0.name }.joined(separator: "\n\n")
            screen?.colorLabel.text = selectedItemsText
            screen?.colorLabel.textColor = UIColor.black
            screen?.pencilColorButton.isHidden = false
            colorSelectedItems = selectedItems
        }
    }
    
    func emptySelectItems(_ selectedItems: [ItemModel], forCategory category: String) {
        if category == screen?.brandTitleLabel.text && selectedItems == [] {
            let attributedText = NSMutableAttributedString(string: "Filtrar por marca")
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12),
                .foregroundColor: UIColor.systemGray,
            ]
            attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
            screen?.brandLabel.attributedText = attributedText
            screen?.pencilBrandButton.isHidden = true
            brandSelectedItems = selectedItems
        } else if category == screen?.colorTitleLabel.text && selectedItems == [] {
            let attributedText = NSMutableAttributedString(string: "Filtrar por cor")
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12),
                .foregroundColor: UIColor.systemGray,
            ]
            attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
            screen?.colorLabel.attributedText = attributedText
            screen?.pencilColorButton.isHidden = true
            colorSelectedItems = selectedItems
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SearchViewController: SearchScreenProtocol {
    func actionFilterButton() {
        print(#function)
    }
    
    func actionCleanButton() {
        //atributos do campo marca
        let attributedBrandText = NSMutableAttributedString(string: "Filtrar por marca")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedBrandText.addAttributes(attributes, range: NSRange(location: 0, length: attributedBrandText.length))
        screen?.brandLabel.attributedText = attributedBrandText
        
        //atributos do campo motor
        let attributedEngineText = NSMutableAttributedString(string: "Filtrar por motor")
        let attributesEngine: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedEngineText.addAttributes(attributesEngine, range: NSRange(location: 0, length: attributedEngineText.length))
        screen?.engineLabel.attributedText = attributedEngineText
        
        //atributos do campo ano
        let attributedYearText = NSMutableAttributedString(string: "Filtrar por ano")
        let attributesYear: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedYearText.addAttributes(attributesYear, range: NSRange(location: 0, length: attributedYearText.length))
        screen?.yearLabel.attributedText = attributedYearText
        
        //atributos do campo cor
        let attributedColorText = NSMutableAttributedString(string: "Filtrar por cor")
        let attributesColor: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedColorText.addAttributes(attributesColor, range: NSRange(location: 0, length: attributedColorText.length))
        screen?.colorLabel.attributedText = attributedColorText
        
        //esconder o ícone de lapis
        screen?.pencilBrandButton.isHidden = true
        screen?.pencilEngineButton.isHidden = true
        screen?.pencilYearButton.isHidden = true
        screen?.pencilColorButton.isHidden = true
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
