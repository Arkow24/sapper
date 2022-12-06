//
//  BaseView.swift
//  SapperFinal
//
//  Created by Arkow on 30/09/2022.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupView() {}
    func setupSubviews() {}
    func setupConstraints() {}
}
