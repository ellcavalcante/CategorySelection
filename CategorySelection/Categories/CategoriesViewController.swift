//
//  CategoriesViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 22/09/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var screen: CategoriesScreen?
    var searchVC: SearchViewController = SearchViewController()
    var itensBrand: [ItensModel] = [ItensModel(itens: "Toyota"),
                                    ItensModel(itens: "Ford"),
                                    ItensModel(itens: "Volkswagen"),
                                    ItensModel(itens: "Honda")]
    
    var titleLabel: String
    var selectedItems: [String] = []
    var cell: ItensTableViewCell = ItensTableViewCell()
    
    var selectedItemsCount: Int {
        return selectedItems.count
    }

    
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
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
        screen?.itensTableView.allowsMultipleSelection = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func updateButtonTitle() {
        let title = "Aplicar (\(selectedItemsCount))"
        screen?.applyButton.setTitle(title, for: .normal)
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itensBrand.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItensTableViewCell.identifier, for: indexPath) as? ItensTableViewCell
        cell?.setUpCell(data: itensBrand[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ItensTableViewCell {
            cell.checkEmptyView.isHidden = true
            cell.checkFilledView.isHidden = false
            cell.filledView.isHidden = false
            let selectedItem = itensBrand[indexPath.row].itens
            selectedItems.append(selectedItem)
            updateButtonTitle()
            print("\(selectedItems)")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ItensTableViewCell {
            cell.checkEmptyView.isHidden = false
            cell.checkFilledView.isHidden = true
            cell.filledView.isHidden = true
            let deselectedItem = itensBrand[indexPath.row].itens
            if let index = selectedItems.firstIndex(of: deselectedItem) {
            selectedItems.remove(at: index)
            updateButtonTitle()
            print("\(selectedItems)")
            }
        }
    }
}



func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 55
}

extension CategoriesViewController: CategoriesScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionCleanButton() {
        if selectedItems.isEmpty {
                let alertController = UIAlertController(title: "Nenhum item selecionado", message: "Selecione os itens antes de limpar.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            } else {
                selectedItems.removeAll()
                screen?.itensTableView.reloadData()
                print("Todos os itens removidos")
            }
    }
    
    func actionFilterButton() {
        print(#function)
    }
}
