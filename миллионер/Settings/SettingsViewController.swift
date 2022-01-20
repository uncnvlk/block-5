//
//  SettingsViewController.swift
//  миллионер
//
//  Created by Elizaveta Sidorenkova on 10.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var mode: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Game.shared.modeGame == .random {
            mode.text = "Случайный"
        } else {
            mode.text = "Последовательный"
        }
    }
    
    @IBAction func changeMode(_ sender: Any) {
        if Game.shared.modeGame == .random {
            Game.shared.modeGame = .serially
            mode.text = "Последовательный"
        } else {
            Game.shared.modeGame = .random
            mode.text = "Случайный"
        }
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        let MainVC = R.Storyboard.Main.instantiateInitialViewController()
        MainVC?.modalPresentationStyle = .fullScreen
        self.present(MainVC!, animated: true)
        
    }
}
