//
//  CategoriesViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 22/09/23.
//

protocol CategoriesViewControllerDelegate: AnyObject {
    func didSelectItems(_ selectedItems: [DataModel], forCategory category: String)
}

import UIKit

class CategoriesViewController: UIViewController {
    
    weak var delegate: CategoriesViewControllerDelegate?
    
    var screen: CategoriesScreen?
    var dataArray: [DataModel] = []
    var selectedItems: [DataModel] = []
    var titleLabel: String
    
    var selectedItemsCount: Int {
        return selectedItems.count
    }
    
    init(titleLabel: String, dataArray: [DataModel], selectedItems: [DataModel]) {
        
        self.titleLabel = titleLabel
        self.dataArray = dataArray
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
        screen?.itensTableView.reloadData()
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
        
        // Verifica se o id do item existe em selectedItems
        if selectedItems.contains(where: { $0.id == item.id }) {
            // O item está em selectedItems
            cell?.checkEmptyView.isHidden = true
            cell?.checkFilledView.isHidden = false
            cell?.filledView.isHidden = false
        } else {
            // O item não está em selectedItems
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
            let selectedItem = dataArray[indexPath.row]
            if selectedItems.contains(where: { $0.id == selectedItem.id }) {
                // O item já está selecionado, então remova-o.
                if let index = selectedItems.firstIndex(where: { $0.id == selectedItem.id }) {
                    selectedItems.remove(at: index)
                }
                cell.checkEmptyView.isHidden = false
                cell.checkFilledView.isHidden = true
                cell.filledView.isHidden = true
            } else {
                // O item não está selecionado, então adicione-o.
                selectedItems.append(selectedItem)
                cell.checkEmptyView.isHidden = true
                cell.checkFilledView.isHidden = false
                cell.filledView.isHidden = false
            }
            
            updateButtonTitle()
            screen?.itensTableView.reloadData()
            print("\(selectedItems)")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ItensTableViewCell {
            let deselectedItem = dataArray[indexPath.row]
            if let index = selectedItems.firstIndex(where: { $0.id == deselectedItem.id }) {
                // Se o item estiver no array selectedItems, remova-o.
                selectedItems.remove(at: index)
            }
            cell.checkEmptyView.isHidden = false
            cell.checkFilledView.isHidden = true
            cell.filledView.isHidden = true
            updateButtonTitle()
            print("\(selectedItems)")
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
        delegate?.didSelectItems(selectedItems, forCategory: titleLabel)
        navigationController?.popViewController(animated: true)
    }
}





