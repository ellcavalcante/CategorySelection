//
//  CategoriesViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 22/09/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var screen: CategoriesScreen?
    var itensBrand: [ItensModel] = [ItensModel(itens: "Toyota"),
                                    ItensModel(itens: "Ford"),
                                    ItensModel(itens: "Volkswagen"),
                                    ItensModel(itens: "Honda")]
    
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
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
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
