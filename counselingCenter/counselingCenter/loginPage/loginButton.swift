//
//  loginButton.swift
//  counselingCenter
//
//  Created by leehwajin on 2023/12/22.
//

import UIKit

class loginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        setupConfiguration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
        setupConfiguration()
        setupAttributedTitle()
    }
    
    private func setupButton() {
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
    }
    
    private func setupConfiguration() {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "message.fill")
        configuration.background.backgroundColor = .yellow
        configuration.baseForegroundColor = .brown
        configuration.contentInsets = .init(top: 15, leading: 10, bottom: 15, trailing: 10)
        configuration.imagePadding = 10
        self.configuration = configuration
    }
    
    private func setupAttributedTitle() {
            let attributeString = NSMutableAttributedString(
                string: "카카오톡으로 로그인하기",
                attributes: [
                    .font: UIFont.boldSystemFont(ofSize: 20),
                    .foregroundColor: UIColor.brown
                ]
            )
            self.setAttributedTitle(attributeString, for: .normal)
        }
}
