//
//  EnterNameView.swift
//  SapperFinal
//
//  Created by Arkow on 30/09/2022.
//

import Foundation
import UIKit


final class EnterNameView: BaseView {
    
    // MARK: - Subviews
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Set your name"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SET", for: .normal)
//        button.setImage(.init(systemName: "square.and.arrow.up"), for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 50
       
        return button
    }()
    
    let textField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "set your name..."
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 30)
        textField.layer.cornerRadius = 5
        textField.borderStyle = .line
        return textField
    }()
    
    // MARK: - Setup
    
    override func setupView() {
        backgroundColor = .white
    }

    override func setupSubviews() {
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(nextButton)
    }
 
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 120),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -300),
            nextButton.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
}
