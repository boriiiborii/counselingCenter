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
        nameLabel.text = UserInfoModel.share.name
    }
    
    private func roundCorners() {
        [nameLabel, descriptionLabel, buttonBackgroundColorLabel].forEach {
            $0.self?.roundCorners(cornerRadius: 10)
        }
        buttonStackView.subviews.forEach{$0.self.roundCorners(cornerRadius: 10)}
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
