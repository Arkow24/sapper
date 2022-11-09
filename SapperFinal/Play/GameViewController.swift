//
//  GameViewController.swift
//  SapperFinal
//
//  Created by Arkow on 02/10/2022.
//

import Foundation
import UIKit


final class GameViewController: UIViewController {
    
    //MARK: - Properties
    
    var contentView: GameView {
        return view as! GameView
    }
    
    var player: UserModel?
    var data: [Int] = Array(0...59)
    var hitet: [Int] = []
    var missed: [Int] = []
    var resultScore: Int = 0

    //MARK: - Lifecycle
    
    override func loadView() {
        view = GameView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupBindings()
    }
    
    //MARK: - Setup
    
    func setupView() {
        guard let selectedPlayer = player else {return}
        
        title = "Play with: \(String(describing: selectedPlayer.name))"
        contentView.playCollectionView.dataSource = self
        contentView.playCollectionView.delegate = self
        contentView.playCollectionView.register(GameViewCell.self, forCellWithReuseIdentifier: GameViewCell.identifier)
    }
    
    func setupBindings() {
        
    }
    
}

extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameViewCell.identifier, for: indexPath) as? GameViewCell else {return UICollectionViewCell()}
        
        let item = data[indexPath.item]
        
        cell.titleLabel.text = String(item)
        cell.backgroundColor = hitet.contains(indexPath.item) ? .red : missed.contains(indexPath.item) ? .gray : .white
        
        return cell
    }
}

extension GameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let player = player else {return}
        
        if hitet.count < 5 {
            if player.positions.contains(indexPath.item) && hitet.contains(indexPath.item) == false {
                hitet.append(indexPath.item)
                if hitet.count == 5 {
                    contentView.mainButton.backgroundColor = .black
                    self.resultScore = missed.count + 5
                    let action = UIAction { _ in
                        let next = ResultPanelViewController()
                        self.navigationController?.setViewControllers([next], animated: true)
                        next.resultScore = self.resultScore
                        next.selectedPlayer = self.player
                    }
                    contentView.mainButton.addAction(action, for: .touchUpInside)
                }
            } else if missed.contains(indexPath.item) == false && hitet.contains(indexPath.item) == false {
                missed.append(indexPath.item)
            }
        }
        collectionView.reloadData()
    }
}
