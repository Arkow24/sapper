//
//  LobbyView.swift
//  SapperFinal
//
//  Created by Arkow on 01/10/2022.
//

import Foundation
import UIKit


final class LobbyView: BaseView {
    
    // MARK: - Properies
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsMultipleSelection = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    let setButton: UIButton = {
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
        addSubview(tableView)
        addSubview(setButton)
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            setButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -20),
            setButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            setButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            setButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            setButton.heightAnchor.constraint(equalToConstant: 70)
        
        ])
    }
    
}
