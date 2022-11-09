//
//  ResultPanelView.swift
//  SapperFinal
//
//  Created by Arkow on 06/10/2022.
//

import Foundation
import UIKit

final class ResultPanelView: BaseView {
    
    //MARK: - Properties
    
    let playerName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let resultPlayer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let returnButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Return to Play Screen", for: .normal)
        button.backgroundColor = .red
        
        return button
    }()
    
    //MARK: - Setup
    
    override func setupView() {
        backgroundColor = .lightGray
    }
    
    override func setupSubviews() {
        addSubview(playerName)
        addSubview(resultPlayer)
        addSubview(returnButton)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            playerName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            playerName.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            playerName.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            resultPlayer.topAnchor.constraint(equalTo: playerName.bottomAnchor, constant: 30),
            resultPlayer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultPlayer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            returnButton.topAnchor.constraint(equalTo: resultPlayer.bottomAnchor, constant: 40),
            returnButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            returnButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            returnButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            returnButton.heightAnchor.constraint(equalToConstant: 60)
        
        ])
    }
}
