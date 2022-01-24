//
//  GameViewController.swift
//  XO-game
//
//  Created by Evgeny Kireev on 25/02/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    private var side = true
    private let gameboard = Gameboard()
    private var currentState: GameState! {
        didSet {
            self.currentState.begin()
        }
    }
    
    private lazy var referee = Referee(gameboard: self.gameboard)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goToFirstState()
        
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            
            if self.side == false {
            let randomRow = Int.random(in: 0...2)
            let randomColumn = Int.random(in: 0...2)
            var position = GameboardPosition(column: randomColumn, row: randomRow)
                self.changeState(position: position)
            } else {
                self.changeState(position: position)
                    }
        }
        
    }
    
    
    private func changeState(position: GameboardPosition) {
        self.currentState.addMark(at: position)
        if self.currentState.isCompleted {
            self.goToNextState()
        }
    }
    private func goToFirstState() {
        let player = Player.first
        self.currentState = ComputerInputState(player: player,
                                             markViewPrototype: player.markViewPrototype,
                                             gameViewController: self,
                                             gameboard: gameboard,
                                             gameboardView: gameboardView)
    }

    private func goToNextState() {
        if let winner = self.referee.determineWinner() {
            self.currentState = GameEndedState(winner: winner, gameViewController: self)
            return
        }
        if let playerInputState = currentState as? ComputerInputState {
            let player = playerInputState.player.next
            if self.side == true { self.side = false}
            else {self.side = true}
            self.currentState = ComputerInputState(player: player,
                                                 markViewPrototype: player.markViewPrototype,
                                                 gameViewController: self,
                                                 gameboard: gameboard,
                                                 gameboardView: gameboardView)
        }
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        Log(.restartGame)
    }
}
