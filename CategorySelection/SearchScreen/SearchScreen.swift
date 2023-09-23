//
//  SearchScreen.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 21/09/23.
//

import UIKit

protocol SearchScreenProtocol {
    func actionBackButton()
    func actionCleanButton()
    func actionFilterButton()
}

class SearchScreen: UIView {
    
    var delegate: SearchScreenProtocol?
    
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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Buscar"
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
    
    public lazy var typeSomethingTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 7.5
        textField.layer.borderColor = UIColor(displayP3Red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0).cgColor
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        let placeholderText = "Digite algo aqui..."
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12.0),
            .foregroundColor: UIColor.systemGray
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        textField.textColor = .darkGray
        textField.clearButtonMode = .whileEditing
        //        textField.addTarget(self, action: #selector(validateTextFields), for: .editingChanged)
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        return textField
    }()

    public lazy var filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Filtrar", for: .normal)
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
        delegate?.actionFilterButton()
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
        addSubview(cleanButton)
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(typeSomethingTextField)
        addSubview(bottomView)
        addSubview(filterButton)
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
            
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            
            cleanButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            cleanButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),

            typeSomethingTextField.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            typeSomethingTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            typeSomethingTextField.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            typeSomethingTextField.heightAnchor.constraint(equalToConstant: 44),
            
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 95),
            
            filterButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            filterButton.heightAnchor.constraint(equalToConstant: 41),
            
        ])
    }
}
