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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        animatingWelcomeLabel()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func animatingWelcomeLabel() {
        
        //레이블의 투명도를 0으로 만들어 가리기
        welcomeLabel1.alpha = 0
        welcomeLabel2.alpha = 0
        
        //일정 시간 후에 투명도를 1로 만들어 레이블 보이게1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.5) {
                self.welcomeLabel1.alpha = 1
            }
        }
        
        //일정 시간 후에 투명도를 1로 만들어 레이블 보이게2
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            UIView.animate(withDuration: 0.5) {
                self.welcomeLabel2.alpha = 1
            }
        }
    }
    
    
}

