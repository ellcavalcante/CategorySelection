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
        let arrayToPass: [ItemModel] = [ItemModel(name: "Toyota", id: 1, modelos:
                                                    [Modelos(id: 101, name: "Corolla", releaseYear: 1966, engine: "4 Cilindros"),
                                                     Modelos(id: 102, name: "Camry", releaseYear: 1982, engine: "V6"),
                                                     Modelos(id: 103, name: "Rav4", releaseYear: 1994, engine: "4 Cilindros"),
                                                     Modelos(id: 104, name: "Highlander", releaseYear: 2001, engine: "V6"),
                                                     Modelos(id: 105, name: "Prius", releaseYear: 1997, engine: "Híbrido"),
                                                     Modelos(id: 106, name: "Corolla Cross", releaseYear: 2020, engine: "4 Cilindros"),
                                                     Modelos(id: 107, name: "C-HR", releaseYear: 2016, engine: "4 Cilindros"),
                                                     Modelos(id: 108, name: "Land Cruiser", releaseYear: 1951, engine: "V8"),
                                                     Modelos(id: 109, name: "Yaris", releaseYear: 1999, engine: "4 Cilindros"),
                                                     Modelos(id: 110, name: "Tacoma", releaseYear: 1995, engine: "V6")]),
                                        
                                        ItemModel(name: "Ford", id: 2, modelos:
                                                    [Modelos(id: 201, name: "F-150", releaseYear: 1975, engine: "V6"),
                                                     Modelos(id: 202, name: "Mustang", releaseYear: 1964, engine: "V8"),
                                                     Modelos(id: 203, name: "Explorer", releaseYear: 1990, engine: "4 cilindros"),
                                                     Modelos(id: 204, name: "Escape", releaseYear: 2000, engine: "4 Cilindros"),
                                                     Modelos(id: 205, name: "Edge", releaseYear: 2006, engine: "V6"),
                                                     Modelos(id: 206, name: "Focus", releaseYear: 1998, engine: "4 Cilindros"),
                                                     Modelos(id: 207, name: "Expedition", releaseYear: 1996, engine: "V8"),
                                                     Modelos(id: 208, name: "Fiesta", releaseYear: 1976, engine: "4 cilindros"),
                                                     Modelos(id: 209, name: "Ranger", releaseYear: 1983, engine: "4 cilindros"),
                                                     Modelos(id: 210, name: "Bronco", releaseYear: 1965, engine: "V6")]),
                                        
                                        ItemModel(name: "Volkswagen", id: 3, modelos:
                                                    [Modelos(id: 301, name: "Golf", releaseYear: 1974, engine: "4 cilindros"),
                                                     Modelos(id: 302, name: "Passat", releaseYear: 1973, engine: "4 cilindros"),
                                                     Modelos(id: 303, name: "Tiguan", releaseYear: 2007, engine: "4 cilindros"),
                                                     Modelos(id: 304, name: "Jetta", releaseYear: 1979, engine: "4 Cilindros"),
                                                     Modelos(id: 305, name: "Atlas", releaseYear: 2017, engine: "V6"),
                                                     Modelos(id: 306, name: "Arteon", releaseYear: 2017, engine: "4 Cilindros"),
                                                     Modelos(id: 307, name: "Polo", releaseYear: 1975, engine: "4 Cilindros"),
                                                     Modelos(id: 308, name: "Taos", releaseYear: 2020, engine: "4 cilindros"),
                                                     Modelos(id: 309, name: "ID.3", releaseYear: 2020, engine: "Elétrico"),
                                                     Modelos(id: 310, name: "Touareg", releaseYear: 2002, engine: "V6")]),
                                        
                                        ItemModel(name: "Honda", id: 4, modelos:
                                                    [Modelos(id: 401, name: "Civic", releaseYear: 1972, engine: "4 cilindros"),
                                                     Modelos(id: 402, name: "Accord", releaseYear: 1976, engine: "4 cilindros"),
                                                     Modelos(id: 403, name: "CR-V", releaseYear: 1995, engine: "4 cilindros"),
                                                     Modelos(id: 404, name: "Fit", releaseYear: 2001, engine: "4 Cilindros"),
                                                     Modelos(id: 405, name: "Pilot", releaseYear: 2002, engine: "V6"),
                                                     Modelos(id: 406, name: "HR-V", releaseYear: 1998, engine: "4 Cilindros"),
                                                     Modelos(id: 407, name: "Odyssey", releaseYear: 1994, engine: "V6")])]
                                        
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.brandTitleLabel.text ?? "", dataArray: arrayToPass, selectedItems: brandSelectedItems)
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
        let arrayColorToPass: [ItemModel] = []
//        ItemModel(name: "Branco", id: 1),
//                                             ItemModel(name: "Preto", id: 2),
//                                             ItemModel(name: "Prata", id: 3),
//                                             ItemModel(name: "Cinza", id: 4),
//                                             ItemModel(name: "Azul", id: 5),
//                                             ItemModel(name: "Vermelho", id: 6),
//                                             ItemModel(name: "Verde", id: 7),
//                                             ItemModel(name: "Amarelo", id: 8),
//                                             ItemModel(name: "Laranja", id: 9),
//                                             ItemModel(name: "Marrom", id: 10)
                let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.colorTitleLabel.text ?? "", dataArray: arrayColorToPass, selectedItems: colorSelectedItems)
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
