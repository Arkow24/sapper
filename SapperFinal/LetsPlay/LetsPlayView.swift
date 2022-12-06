//
//  LetsPlayView.swift
//  SapperFinal
//
//  Created by Arkow on 30/09/2022.
//

import Foundation
import UIKit

final class LetsPlayView: BaseView {
    
    // MARK: - Subviews
    
    let playButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PLAY", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let createbutton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CREATE", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    // MARK: - Setup
    
    override func setupView() {
        backgroundColor = .white
    }

    override func setupSubviews() {
       addSubview(playButton)
        addSubview(createbutton)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            createbutton.topAnchor.constraint(equalTo: playButton.bottomAnchor),
            createbutton.leadingAnchor.constraint(equalTo: leadingAnchor),
            createbutton.trailingAnchor.constraint(equalTo: trailingAnchor),
            createbutton.bottomAnchor.constraint(equalTo: bottomAnchor),
            createbutton.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
