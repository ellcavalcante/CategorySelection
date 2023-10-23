//
//  CategoriesScreen.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 22/09/23.
//

import UIKit

protocol CategoriesScreenProtocol {
    func actionBackButton()
    func actionCleanButton()
    func actionApplyButton()
}

class CategoriesScreen: UIView {
    
    var delegate: CategoriesScreenProtocol?
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOpacity = 0.10
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius =  4
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOpacity = 0.10
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius =  4
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categorias"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let bButton = UIButton()
        bButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.setImage(UIImage(named: "left"), for: .normal)
        bButton.imageView?.contentMode = .scaleToFill
        bButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bButton
    }()
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    private lazy var cleanButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Limpar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 149/255, green: 54/255, blue: 244/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedCleanButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCleanButton(){
        delegate?.actionCleanButton()
    }
    
    public lazy var applyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Aplicar (0)", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 149/255, green: 54/255, blue: 244/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 20.0
        button.backgroundColor = UIColor(red: 149/255, green: 54/255, blue: 244/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedFilterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedFilterButton(){
        delegate?.actionApplyButton()
    }
    
    public lazy var itensTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = true
        tableView.register(ItensTableViewCell.self, forCellReuseIdentifier: ItensTableViewCell.identifier)
        return tableView
    }()

    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        itensTableView.delegate = delegate
        itensTableView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(topView)
        addSubview(titleLabel)
        addSubview(itensTableView)
        addSubview(bottomView)
        addSubview(cleanButton)
        addSubview(backButton)
        addSubview(applyButton)
        backgroundColor()
        setUpConstraints()
    }
    
    private func backgroundColor() {
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 95),
            
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 25),
            
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            
            cleanButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            cleanButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            
            applyButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            applyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            applyButton.heightAnchor.constraint(equalToConstant: 41),
            
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 95),
            
            itensTableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10),
            itensTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itensTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            itensTableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            
        ])
    }
}
