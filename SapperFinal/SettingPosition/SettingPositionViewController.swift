//
//  SettingPositionViewController.swift
//  SapperFinal
//
//  Created by Arkow on 01/10/2022.
//

import Foundation
import UIKit

final class SettingPositionViewController: UIViewController {
    
    //MARK: - Properties

    var dataUserLocal: UserModel?
    var selectedPosition: [Int] = []
    var contentView: SettingPositionView {
        return view as! SettingPositionView
    }
    
    let data: [Int] = Array(0...59)
    
    //MARK: - Lifecycle
    
    override func loadView() {
        view = SettingPositionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - Setup
    
    func setupView() {
        title = "Create your positions"
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        contentView.collectionView.register(SettingPositionViewCell.self,
        forCellWithReuseIdentifier: SettingPositionViewCell.identifier)
    }
}

extension SettingPositionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SettingPositionViewCell.identifier, for: indexPath)
            as? SettingPositionViewCell else {return UICollectionViewCell()}
        
        let item = data[indexPath.item]
        cell.numberLabel.text = String(item)
        cell.backgroundColor = selectedPosition.contains(indexPath.item) ? .red : .white

        return cell
    }
}

extension SettingPositionViewController: UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard var localUser = dataUserLocal else {return}
        
        if selectedPosition.count < 5 {
            if selectedPosition.count == 4 {
                addPositiones(value: indexPath.item)
                let action = UIAction { _ in
                    let movePlayScreen = LetsPlayViewController()
                    self.navigationController?.setViewControllers([movePlayScreen], animated: true)
                    localUser.positions = self.selectedPosition
                    FirebaseClient.shared.addUserToDataBase(value: localUser)
                }
                contentView.saveButton.backgroundColor = .black
                contentView.saveButton.addAction(action, for: .touchUpInside)
            } else {
                addPositiones(value: indexPath.item)
            }
        }
        collectionView.reloadData()
    }
    
    func addPositiones(value: Int) {
        guard var localUser = dataUserLocal else {return}
        
        if selectedPosition.contains(value) == false {
            selectedPosition.append(value)
            localUser.positions.append(value)
        }
    }
}
