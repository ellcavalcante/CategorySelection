//
//  Screen.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 20/09/23.
//

import UIKit

protocol ScreenProtocol: AnyObject {
    func actionSearchButton()
}

class HomeScreen: UIView {
    
    var delegate: ScreenProtocol?
    
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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Desafio da Seleção"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    public lazy var searchJsonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "JSON de busca"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    public lazy var JSONLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.layer.cornerRadius = 7.5
        label.clipsToBounds = true
        label.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    public lazy var inputJsonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "{}"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    public lazy var firstInputJsonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "{}"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var openSearchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ABRIR BUSCA", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitleColor(UIColor(red: 149/255, green: 54/255, blue: 244/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 149/255, green: 54/255, blue: 244/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 20.0
        button.backgroundColor = UIColor(red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedSearchButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSearchButton(){
        delegate?.actionSearchButton()
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
        addSubview(searchJsonLabel)
        addSubview(JSONLabel)
        JSONLabel.addSubview(firstInputJsonLabel)
        JSONLabel.addSubview(inputJsonLabel)
        addSubview(openSearchButton)
        setUpConstraints()
        backgroundColor()
        
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
            
            searchJsonLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            searchJsonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130),
            searchJsonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130),
            
            JSONLabel.topAnchor.constraint(equalTo: searchJsonLabel.bottomAnchor, constant: 12),
            JSONLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            JSONLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            JSONLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 254),
            
            firstInputJsonLabel.topAnchor.constraint(equalTo: JSONLabel.topAnchor, constant: 12),
            firstInputJsonLabel.leadingAnchor.constraint(equalTo: JSONLabel.leadingAnchor, constant: 12),
            firstInputJsonLabel.trailingAnchor.constraint(equalTo: JSONLabel.trailingAnchor, constant: -12),
            
            inputJsonLabel.topAnchor.constraint(equalTo: JSONLabel.topAnchor, constant: 12),
            inputJsonLabel.leadingAnchor.constraint(equalTo: JSONLabel.leadingAnchor, constant: 12),
            inputJsonLabel.trailingAnchor.constraint(equalTo: JSONLabel.trailingAnchor, constant: -12),
            inputJsonLabel.bottomAnchor.constraint(equalTo: JSONLabel.bottomAnchor, constant: -12),
            
            openSearchButton.topAnchor.constraint(equalTo: JSONLabel.bottomAnchor, constant: 36),
            openSearchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            openSearchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            openSearchButton.heightAnchor.constraint(equalToConstant: 41),
            
        ])
    }
}
