//
//  ViewController.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 20/09/23.
//


import UIKit

class HomeViewController: UIViewController {
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
    }
}

extension HomeViewController: SearchViewControllerDelegate {
    func pressBotaoFiltrar(withJSONData jsonData: Data?) {
        if let jsonData = jsonData,
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            screen?.firstInputJsonLabel.isHidden = true
            screen?.inputJsonLabel.isHidden = false
            screen?.inputJsonLabel.text = jsonString
        }
    }
}

extension HomeViewController: ScreenProtocol {
    
    func actionSearchButton() {
        let searcVC: SearchViewController = SearchViewController()
        searcVC.delegate = self
        self.navigationController?.pushViewController(searcVC, animated: true)
    }
}



