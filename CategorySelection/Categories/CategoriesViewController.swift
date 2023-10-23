//
//  CategoriesViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 22/09/23.
//

protocol CategoriesViewControllerDelegate: AnyObject {
    func didSelectItems(_ selectedItems: [ItemModel], forCategory category: String)
    func emptySelectItems(_ selectedItems: [ItemModel], forCategory category: String)
}

import UIKit

class CategoriesViewController: UIViewController {
    
    weak var delegate: CategoriesViewControllerDelegate?
    
    var screen: CategoriesScreen?
    var dataArray: [ItemModel] = []
    var titleLabel: String
    var selectedItems: [ItemModel] = []
    var rowsItems: [ItemModel] = []
    
    var selectedItemsCount: Int {
        return selectedItems.count
    }
    
    init(titleLabel: String, dataArray: [ItemModel], rowsItems: [ItemModel], selectedItems: [ItemModel]) {
        
        self.titleLabel = titleLabel
        self.dataArray = dataArray
        self.rowsItems = rowsItems
        self.selectedItems = selectedItems
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
        updateButtonTitle()
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
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItensTableViewCell.identifier, for: indexPath) as? ItensTableViewCell
        cell?.setUpCell(data: dataArray[indexPath.row])
        let item = dataArray[indexPath.row]
        
        // Check if the item's id exists in rowsItems
        if rowsItems.contains(where: { $0.id == item.id }) {
            // Item is in rowsItems
            cell?.checkEmptyView.isHidden = true
            cell?.checkFilledView.isHidden = false
            cell?.filledView.isHidden = false
        } else {
            // Item is not in rowsItems
            cell?.checkEmptyView.isHidden = false
            cell?.checkFilledView.isHidden = true
            cell?.filledView.isHidden = true
        }
        
        cell?.setUpCell(data: item)
        cell?.selectionStyle = .none
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ItensTableViewCell {
            cell.checkEmptyView.isHidden = true
            cell.checkFilledView.isHidden = false
            cell.filledView.isHidden = false
            let selectedItem = dataArray[indexPath.row]
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
            let deselectedItem = dataArray[indexPath.row]
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
            rowsItems.removeAll()
            updateButtonTitle()
            if let visibleCells = screen?.itensTableView.visibleCells as? [ItensTableViewCell] {
                for cell in visibleCells {
                    cell.checkEmptyView.isHidden = false
                    cell.checkFilledView.isHidden = true
                    cell.filledView.isHidden = true
                }
            }
            screen?.itensTableView.reloadData()
            print("Todos os itens removidos")
        }
    }
    
    func actionApplyButton() {
        if selectedItems.isEmpty {
            delegate?.emptySelectItems([], forCategory: titleLabel)
            navigationController?.popViewController(animated: true)
        } else {
            delegate?.didSelectItems(selectedItems, forCategory: titleLabel)
            navigationController?.popViewController(animated: true)
        }
    }
}



