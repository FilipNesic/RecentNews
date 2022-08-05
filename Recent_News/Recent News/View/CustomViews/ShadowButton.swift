//
//  LiveNewsGradientButton.swift
//  Recent News
//
//  Created by Filip  on 5.5.22..
//

import UIKit

class ShadowButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowRadius = 20
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
