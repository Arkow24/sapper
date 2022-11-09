//
//  LobbyViewCell.swift
//  SapperFinal
//
//  Created by Arkow on 01/10/2022.
//

import Foundation
import UIKit


final class LobbyViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static var identifier: String {
        return String(describing: self.self)
    }
    
    //MARK: - Subviews
    
    let userLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        //label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.text = "test"
        return label
    }()
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setupView() {
        backgroundColor = .white
    }
    
    func setupSubviews() {
        [userLabel].forEach(addSubview)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            userLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            userLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10) 
        ])
    }
}
