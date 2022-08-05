//
//  GameRulesAlert.swift
//  Recent News
//
//  Created by Filip  on 17.6.22..
//

import UIKit

class GameRulesAlertViewController: UIViewController {
    
    @IBOutlet weak var logoBackground: UIView!
    @IBOutlet weak var greenTextBackground: UIView!
    @IBOutlet weak var grayTextBeckground: UIView!
    @IBOutlet weak var letsPlayButton: ShadowButton!
    
    @IBOutlet weak var rulesText: UITextView!
    
    static var identifier = "GameRulesAlertViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoBackground.layer.cornerRadius = 7
        greenTextBackground.layer.cornerRadius = 7
        grayTextBeckground.layer.cornerRadius = 7
        rulesText.layer.cornerRadius = 7
        
        rulesText.text = "In question box are statements or questions that may be TRUE or FALSE. Collect as many correct answers as possible. Above the question box You can see the score of correct answers in a row. Questions / statements are from the field of Geography, Science, Music, Sports and various other topics. Good luck Conqueror!"
    }

    @IBAction func letsPlayButtonTapped(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}
