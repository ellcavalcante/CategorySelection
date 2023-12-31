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
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        return textField
    }()
    
    public lazy var brandView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        view.layer.cornerRadius = 7.5
        view.clipsToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0).cgColor
        return view
    }()
    
    public lazy var brandTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Marca"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    public lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "Filtrar por marca")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
        return label
    }()
    
    public lazy var pencilBrandButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic-edit"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.isHidden = true
        return button
    }()
    
    public lazy var engineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        view.layer.cornerRadius = 7.5
        view.clipsToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0).cgColor
        return view
    }()
    
    public lazy var engineTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Motor"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    public lazy var engineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "Filtrar por motor")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
        return label
    }()
    
    public lazy var pencilEngineButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic-edit"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.isHidden = true
        return button
    }()
    
    public lazy var yearView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        view.layer.cornerRadius = 7.5
        view.clipsToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0).cgColor
        return view
    }()
    
    public lazy var yearTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ano"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    public lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "Filtrar por ano")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
        return label
    }()
    
    public lazy var pencilYearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic-edit"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.isHidden = true
        return button
    }()
    
    public lazy var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        view.layer.cornerRadius = 7.5
        view.clipsToBounds = true
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0).cgColor
        return view
    }()
    
    public lazy var colorTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cor"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    public lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "Filtrar por cor")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.systemGray,
        ]
        attributedText.addAttributes(attributes, range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
        return label
    }()

    public lazy var pencilColorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic-edit"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.isHidden = true
        return button
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
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        typeSomethingTextField.delegate = delegate
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        
        addSubview(scrollView)
        scrollView.addSubview(conteinerView)
        conteinerView.addSubview(typeSomethingTextField)
        conteinerView.addSubview(brandTitleLabel)
        conteinerView.addSubview(brandView)
        brandView.addSubview(brandLabel)
        brandView.addSubview(pencilBrandButton)
        
        conteinerView.addSubview(engineTitleLabel)
        conteinerView.addSubview(engineView)
        engineView.addSubview(engineLabel)
        engineView.addSubview(pencilEngineButton)
        
        conteinerView.addSubview(yearTitleLabel)
        conteinerView.addSubview(yearView)
        yearView.addSubview(yearLabel)
        yearView.addSubview(pencilYearButton)
        
        conteinerView.addSubview(colorTitleLabel)
        conteinerView.addSubview(colorView)
        colorView.addSubview(colorLabel)
        colorView.addSubview(pencilColorButton)
        
        addSubview(topView)
        addSubview(bottomView)
        addSubview(cleanButton)
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(filterButton)
        
        setUpConstraints()
        backgroundColor()
    }
    
    private func backgroundColor() {
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),

            conteinerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            conteinerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            conteinerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            conteinerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
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

            typeSomethingTextField.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 32),
            typeSomethingTextField.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            typeSomethingTextField.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),
            typeSomethingTextField.heightAnchor.constraint(equalToConstant: 44),

            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 95),

            filterButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            filterButton.heightAnchor.constraint(equalToConstant: 41),

            brandTitleLabel.topAnchor.constraint(equalTo: typeSomethingTextField.bottomAnchor, constant: 22),
            brandTitleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            brandTitleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -300),

            brandView.topAnchor.constraint(equalTo: brandTitleLabel.bottomAnchor, constant: 12),
            brandView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            brandView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),

            brandLabel.topAnchor.constraint(equalTo: brandView.topAnchor, constant: 10),
            brandLabel.leadingAnchor.constraint(equalTo: brandView.leadingAnchor, constant: 12),
            brandLabel.trailingAnchor.constraint(equalTo: brandView.trailingAnchor),
            brandLabel.bottomAnchor.constraint(equalTo: brandView.bottomAnchor, constant: -10),
            brandLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),

            pencilBrandButton.centerYAnchor.constraint(equalTo: brandView.centerYAnchor),
            pencilBrandButton.trailingAnchor.constraint(equalTo: brandView.trailingAnchor, constant: -22),

            engineTitleLabel.topAnchor.constraint(equalTo: brandView.bottomAnchor, constant: 12),
            engineTitleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            engineTitleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -300),

            engineView.topAnchor.constraint(equalTo: engineTitleLabel.bottomAnchor, constant: 12),
            engineView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            engineView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),

            engineLabel.topAnchor.constraint(equalTo: engineView.topAnchor, constant: 10),
            engineLabel.leadingAnchor.constraint(equalTo: engineView.leadingAnchor, constant: 12),
            engineLabel.trailingAnchor.constraint(equalTo: engineView.trailingAnchor),
            engineLabel.bottomAnchor.constraint(equalTo: engineView.bottomAnchor, constant: -10),
            engineLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),

            pencilEngineButton.centerYAnchor.constraint(equalTo: engineView.centerYAnchor),
            pencilEngineButton.trailingAnchor.constraint(equalTo: engineView.trailingAnchor, constant: -22),

            yearTitleLabel.topAnchor.constraint(equalTo: engineView.bottomAnchor, constant: 12),
            yearTitleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            yearTitleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -330),

            yearView.topAnchor.constraint(equalTo: yearTitleLabel.bottomAnchor, constant: 12),
            yearView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            yearView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),

            yearLabel.topAnchor.constraint(equalTo: yearView.topAnchor, constant: 10),
            yearLabel.leadingAnchor.constraint(equalTo: yearView.leadingAnchor, constant: 12),
            yearLabel.trailingAnchor.constraint(equalTo: yearView.trailingAnchor),
            yearLabel.bottomAnchor.constraint(equalTo: yearView.bottomAnchor, constant: -10),
            yearLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),

            pencilYearButton.centerYAnchor.constraint(equalTo: yearView.centerYAnchor),
            pencilYearButton.trailingAnchor.constraint(equalTo: yearView.trailingAnchor, constant: -22),

            colorTitleLabel.topAnchor.constraint(equalTo: yearView.bottomAnchor, constant: 12),
            colorTitleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            colorTitleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -330),

            colorView.topAnchor.constraint(equalTo: colorTitleLabel.bottomAnchor, constant: 12),
            colorView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 16),
            colorView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -16),
            colorView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -16),

            colorLabel.topAnchor.constraint(equalTo: colorView.topAnchor, constant: 10),
            colorLabel.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 12),
            colorLabel.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
            colorLabel.bottomAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -10),
            colorLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),

            pencilColorButton.centerYAnchor.constraint(equalTo: colorView.centerYAnchor),
            pencilColorButton.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -22),

        ])
    }
}
