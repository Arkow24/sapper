//
//  SettingPositionViewCell.swift
//  SapperFinal
//
//  Created by Arkow on 01/10/2022.
//

import Foundation
import UIKit

final class SettingPositionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    // MARK: - Subviews
    
    let numberLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setupView() {
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    func setupSubviews() {
        [numberLabel].forEach(addSubview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
