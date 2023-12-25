//
//  ChoiceInterestingViewController.swift
//  counselingCenter
//
//  Created by leehwajin on 2023/12/25.
//

import UIKit

class ChoiceInterestingViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buttonBackgroundColorLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setElement()
        animatingWelcomeLabel()
    }
    
    private func setElement() {
        roundCorners()
        nameLabel.text = (UserInfoModel.share.name ?? "사용자") + "님"
        descriptionLabel.text = "상담에\n자신있는\n분야를\n알려주세요!"
    }
    
    private func roundCorners() {
        [nameLabel, descriptionLabel, buttonBackgroundColorLabel].forEach {
            $0.self?.roundCorners(cornerRadius: 10)
        }
        buttonStackView.subviews.forEach{$0.self.subviews.forEach{
            $0.self.roundCorners(cornerRadius: 10)}}
        nextButton.roundCorners(cornerRadius: 10)
    }
    
    @IBAction func interestedButtonTapped(_ sender: UIButton) {
        toggleButtonTapped(button: sender)
    }
    
    private func toggleButtonTapped(button: UIButton) {
        if button.backgroundColor == .lightBrown {
            button.backgroundColor = .lightGreen
        }else{
            button.backgroundColor = .lightBrown
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //userInfo에다 interestedFiled 채워야함
        setSpecializedField()
        print(UserInfoModel.share.specializedField!)
    }
    
    private func animatingWelcomeLabel() {
        
        //레이블의 투명도를 0으로 만들어 가리기
        nameLabel.alpha = 0
        descriptionLabel.alpha = 0
        buttonBackgroundColorLabel.alpha = 0
        buttonBackgroundColorLabel.subviews.forEach{$0.self.alpha = 0}
        nextButton.alpha = 0
        
        var times = 0.5
        //일정 시간 후에 투명도를 1로 만들어 레이블 보이게
        for element in [nameLabel, descriptionLabel, buttonBackgroundColorLabel, nextButton] {
            DispatchQueue.main.asyncAfter(deadline: .now() + times) {
                UIView.animate(withDuration: 0.5) {
                    element?.alpha = 1
                    element?.subviews.forEach{$0.self.alpha = 1}
                }
            }
            //0.8초 간격으로 구성요소들이 나타남
            times += 0.8
        }
    }
    
    private func setSpecializedField() {
        UserInfoModel.share.specializedField = []
        buttonStackView.subviews.forEach{
            $0.subviews.forEach{
                if let button = $0 as? UIButton,
                    button.backgroundColor == UIColor.lightBrown,
                   let title = button.titleLabel?.text,
                   let field = Field(rawValue: title) {
                    UserInfoModel.share.specializedField?.append(field)
                }
            }
        }
    }
}

