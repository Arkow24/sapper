//
//  LobbyViewController.swift
//  SapperFinal
//
//  Created by Arkow on 01/10/2022.
//

import Foundation
import UIKit

final class LobbyViewCotroller: UIViewController {
    
    //MARK: - Properties
    
    var users: [UserModel] = []
    var selectedPlayer: UserModel?
    var contentView: LobbyView {
        return view as! LobbyView
    }
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = LobbyView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        FirebaseClient.shared.fetchAllUsers { users in
            self.users = users
            self.contentView.tableView.reloadData()
        }
    }
    
    //MARK: - Setup
    
    func setupView() {
        title = "Lobby"
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(LobbyViewCell.self, forCellReuseIdentifier: LobbyViewCell.identifier)
    }
}

extension LobbyViewCotroller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
        withIdentifier: LobbyViewCell.identifier, for: indexPath)
        as? LobbyViewCell else {return UITableViewCell()}

        let item = self.users[indexPath.item]
        cell.userLabel.text = item.name
     
    return cell
    }
}

extension LobbyViewCotroller:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        selectedPlayer = users[indexPath.row]
        if selectedPlayer != nil {
            contentView.setButton.backgroundColor = .black
            let action = UIAction { _ in
                let moveToPlay = GameViewController()
                moveToPlay.player = self.selectedPlayer
                self.navigationController?.setViewControllers([moveToPlay], animated: true)
            }
            contentView.setButton.addAction(action, for: .touchUpInside)
        }
    }
}
