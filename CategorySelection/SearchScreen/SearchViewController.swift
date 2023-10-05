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
        
        let arrayToPass: [ItensModel] = [ItensModel(itens: "Toyota"),
                                         ItensModel(itens: "Ford"),
                                         ItensModel(itens: "Volkswagen"),
                                         ItensModel(itens: "Honda")]
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.brandTitleLabel.text ?? "", dataArray: arrayToPass)
        screenCategories.delegate = self
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func engineViewTapped() {
        let arrayToPass: [ItensModel] = [ItensModel(itens: "4 cilindros"),
                                         ItensModel(itens: "V6"),
                                         ItensModel(itens: "Híbrido"),
                                         ItensModel(itens: "V8")]
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.engineTitleLabel.text ?? "", dataArray: arrayToPass)
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func yearViewTapped() {
        let arrayToPass: [ItensModel] = [ItensModel(itens: "1966"),
                                         ItensModel(itens: "1982"),
                                         ItensModel(itens: "1994"),
                                         ItensModel(itens: "2001"),
                                         ItensModel(itens: "1997"),
                                         ItensModel(itens: "2020"),
                                         ItensModel(itens: "1951"),
                                         ItensModel(itens: "1999"),
                                         ItensModel(itens: "1995"),
                                         ItensModel(itens: "1975")]
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.yearTitleLabel.text ?? "", dataArray: arrayToPass)
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func colorViewTapped() {
        let arrayToPass: [ItensModel] = [ItensModel(itens: "Branco"),
                                         ItensModel(itens: "Preto"),
                                         ItensModel(itens: "Prata"),
                                         ItensModel(itens: "Cinza"),
                                         ItensModel(itens: "Azul"),
                                         ItensModel(itens: "Vermelho"),
                                         ItensModel(itens: "Verde"),
                                         ItensModel(itens: "Amarelo"),
                                         ItensModel(itens: "Laranja"),
                                         ItensModel(itens: "Marrom")]
        let screenCategories: CategoriesViewController = CategoriesViewController(titleLabel: screen?.colorTitleLabel.text ?? "", dataArray: arrayToPass)
        self.navigationController?.pushViewController(screenCategories, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SearchViewController: CategoriesViewControllerDelegate {
    func didSelectItems(_ selectedItems: [String], forCategory category: String) {
        if category == screen?.brandTitleLabel.text {
            let selectedItemsText = selectedItems.joined(separator: "\n\n")
            screen?.brandLabel.text = selectedItemsText
            screen?.brandLabel.textColor = UIColor.black
            screen?.pencilButton.isHidden = false
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
        navigationController?.popToRootViewController(animated: true)
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
        screen?.pencilButton.isHidden = true
    }
    
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
