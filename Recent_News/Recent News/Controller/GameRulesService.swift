//
//  GameRulesService.swift
//  Recent News
//
//  Created by Filip  on 18.6.22..
//

import UIKit

class GameRulesService {
    
    func alert() -> GameRulesAlertViewController {
        
        let storyboard = UIStoryboard(name: "GameAlertStoryboard", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: GameRulesAlertViewController.identifier) as! GameRulesAlertViewController
        
        return alertVC
    }
}
