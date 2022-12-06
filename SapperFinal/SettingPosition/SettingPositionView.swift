//
//  SettingPositionView.swift
//  SapperFinal
//
//  Created by Arkow on 01/10/2022.
//

import Foundation
import UIKit

final class SettingPositionView: BaseView {
    
    // MARK: - Subviews
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let saveView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        saveView.allowsMultipleSelection = false
        saveView.translatesAutoresizingMaskIntoConstraints = false
        return saveView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save Positions", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    // MARK: - Setup
    
    override func setupView() {
        backgroundColor = .white
    }
    
    override func setupSubviews() {
        [collectionView,saveButton].forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            saveButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
