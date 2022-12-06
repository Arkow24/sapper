//
//  LetsPlay.swift
//  SapperFinal
//
//  Created by Arkow on 30/09/2022.
//

import Foundation
import UIKit

final class LetsPlayViewController: UIViewController {
    
    // MARK: - Properties
    
    var user: UserModel?
    var contentView: LetsPlayView {
        return view as! LetsPlayView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = LetsPlayView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBindings()
    }
    
    func setupView() {
       title = "Select mode"
    }
    
    func setupBindings() {
        
        let actionCreate = UIAction  { _ in
            let createView = SettingPositionViewController()
            self.navigationController?.setViewControllers([createView], animated: true)
            createView.dataUserLocal = self.user
        }
        contentView.createbutton.addAction(actionCreate, for: .touchUpInside)
        
        let actionPlay = UIAction { _ in
            let playView = LobbyViewCotroller()
            self.navigationController?.pushViewController(playView, animated: true)
        }
        contentView.playButton.addAction(actionPlay, for: .touchUpInside)
    }
}


