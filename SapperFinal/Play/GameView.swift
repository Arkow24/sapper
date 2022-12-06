//
//  GameView.swift
//  SapperFinal
//
//  Created by Arkow on 02/10/2022.
//

import Foundation
import UIKit

final class GameView: BaseView {
    
    let playCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.allowsMultipleSelection = false
        return collection
    }()
    
    let mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = .red
       return button
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = .white
    }
    
    override func setupSubviews() {
        [playCollectionView,mainButton].forEach(addSubview)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            playCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            playCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            playCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainButton.topAnchor.constraint(equalTo: playCollectionView.bottomAnchor, constant: -20),
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            mainButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
