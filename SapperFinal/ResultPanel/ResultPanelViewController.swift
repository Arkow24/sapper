//
//  ResultPanelViewController.swift
//  SapperFinal
//
//  Created by Arkow on 06/10/2022.
//

import Foundation
import UIKit

final class ResultPanelViewController: UIViewController {
    
    //MARK: - Properties
    
    var contentView: ResultPanelView {
        return view as! ResultPanelView
    }
    var resultScore: Int = 0
    var selectedPlayer: UserModel?
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = ResultPanelView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBindings()
    }
    
    //MARK: - Setup
    
    func setupView() {
        guard let selectedGame = selectedPlayer else {return}
        title = "Result Panel \(selectedGame.name))"
        contentView.playerName.text = selectedGame.name
        contentView.resultPlayer.text = String(resultScore)
    }
    
    func setupBindings() {
        let action = UIAction { _ in
            let back = LetsPlayViewController()
            self.navigationController?.setViewControllers([back], animated: true)
        }
        contentView.returnButton.addAction(action, for: .touchUpInside)
    }
}
