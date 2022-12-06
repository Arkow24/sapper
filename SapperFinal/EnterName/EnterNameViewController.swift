//
//  ViewController.swift
//  SapperFinal
//
//  Created by Arkow on 30/09/2022.
//

import UIKit

final class EnterNameViewController: UIViewController {

    // MARK: - Properties
    
    var name: String?
    var contentView: EnterNameView {
        return view as! EnterNameView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = EnterNameView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupView()
        setupBindings()
    }
    
    func setupView() {
        title = "Welcome"
    }
    
    func setupBindings() {
        let action = UIAction { _ in
            guard let name = self.name else { return }
            let letsPlay = LetsPlayViewController()
            letsPlay.user = UserModel(name: name)
            self.navigationController?.setViewControllers([letsPlay], animated: true)
        }
        contentView.nextButton.addAction(action, for: .touchUpInside)
        contentView.textField.delegate = self
    }
}

extension EnterNameViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name = textField.text
        contentView.textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text != nil {
            contentView.nextButton.backgroundColor = .blue
        }
        return true
    }
}
