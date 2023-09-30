//
//  ItensTableViewCell.swift
//  CategorySelection
//
//  Created by Ellington Cavalcante on 27/09/23.
//

import UIKit

class ItensTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ItensTableViewCell.self)
    
    private lazy var checkEmptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.5
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor(red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0).cgColor
        return view
    }()
    
    public lazy var itensLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var checkFilledView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.5
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor(red: 149/255, green: 54/255, blue: 244/255, alpha: 1.0).cgColor
        view.isHidden = true
        return view
    }()
    
    private lazy var filledView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 149/255, green: 54/255, blue: 244/255, alpha: 1.0)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.5
        view.isHidden = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(checkEmptyView)
        addSubview(itensLabel)
        addSubview(checkFilledView)
        addSubview(filledView)
        setUpConstraints()
    }
    
    public func setUpCell(data: ItensModel) {
        self.itensLabel.text = data.itens
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            itensLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            itensLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 58),
            
            checkEmptyView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkEmptyView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            checkEmptyView.heightAnchor.constraint(equalToConstant: 22),
            checkEmptyView.widthAnchor.constraint(equalToConstant: 22),
            
            checkFilledView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkFilledView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            checkFilledView.heightAnchor.constraint(equalToConstant: 22),
            checkFilledView.widthAnchor.constraint(equalToConstant: 22),

            filledView.topAnchor.constraint(equalTo: checkFilledView.topAnchor, constant: 4),
            filledView.leadingAnchor.constraint(equalTo: checkFilledView.leadingAnchor, constant: 4),
            filledView.trailingAnchor.constraint(equalTo: checkFilledView.trailingAnchor, constant: -4),
            filledView.bottomAnchor.constraint(equalTo: checkFilledView.bottomAnchor, constant: -4)
            
        ])
    }
}
