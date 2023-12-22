//
//  ViewController.swift
//  counselingCenter
//
//  Created by leehwajin on 2023/12/22.
//

import UIKit

class loginController: UIViewController {
    
    @IBOutlet weak var welcomeLabel1: UILabel!
    @IBOutlet weak var welcomeLabel2: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        animatingWelcomeLabel()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginButton()
    }
    
    private func animatingWelcomeLabel() {
        
        //레이블의 투명도를 0으로 만들어 가리기
        welcomeLabel1.alpha = 0
        welcomeLabel2.alpha = 0
        loginButton.alpha = 0
        
        var times = 0.5
        //일정 시간 후에 투명도를 1로 만들어 레이블 보이게
        for element in [welcomeLabel1, welcomeLabel2, loginButton] {
            DispatchQueue.main.asyncAfter(deadline: .now() + times) {
                UIView.animate(withDuration: 0.5) {
                    element?.alpha = 1
                }
            }
            //0.8초 간격으로 구성요소들이 나타남
            times += 0.8
        }
    }
    
    private func setLoginButton() {
        
    }
    
}

