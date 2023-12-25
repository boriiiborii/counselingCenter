//
//  ViewController.swift
//  counselingCenter
//
//  Created by leehwajin on 2023/12/22.
//

import UIKit
import KakaoSDKUser

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

    @IBAction func loginButtonTapped(_ sender: Any) {
        //로그인 로직 진행하기
        
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            //카카오톡이 설치되어있을때 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    let accessToken = oauthToken?.accessToken
                    //카카오 로그인을 통해 토큰을 발급 받은 후 사용자 관리 API호출
                    self.setUserInfo()
                }
            }
        }else {
            //카카오톡이 설치되지 않았을때 웹으로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
               if let error = error {
                 print(error)
               }
               else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                   let accessToken = oauthToken?.accessToken
                   //카카오 로그인을 통해 토큰을 발급 받은 후 사용자 관리 API호출
                   self.setUserInfo()
               }
            }
        }
    }
    
    func setUserInfo() {
        //사용자 관리 api 호출
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                self.welcomeLabel1.text = user?.kakaoAccount?.profile?.nickname
            }
        }
    }
    
}

