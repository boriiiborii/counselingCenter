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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setElement()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
