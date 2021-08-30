//
//  ViewController.swift
//  RPS
//
//  Created by Owner on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var cpLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var rockLabel: UIButton!
    @IBOutlet weak var scissorsLabel: UIButton!
    @IBOutlet weak var paperLabel: UIButton!
    @IBOutlet weak var playAgainLabel: UIButton!
    
    var currentGameState: GameState = GameState.start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
    }
    
    func resetBoard(){
        cpLabel.text = "🎃"
        stateLabel.text = "Lock,Scissors,Paper？"
        rockLabel.isHidden = false
        rockLabel.isEnabled = true
        scissorsLabel.isHidden = false
        scissorsLabel.isEnabled = true
        paperLabel.isHidden = false
        paperLabel.isEnabled = true
        playAgainLabel.isHidden = true
    }
    func play(_ playerTurn: Sign){
        rockLabel.isEnabled = false
        scissorsLabel.isEnabled = false
        paperLabel.isEnabled = false
        
        let opponent = randomSign()
        cpLabel.text = opponent.emoji
        
        currentGameState = playerTurn.takeTurn(opponent)
        switch currentGameState {
        case .draw:
            stateLabel.text = "It's a draw!"
        case .lose:
            stateLabel.text = "Oh... you lose."
        case .win:
            stateLabel.text = "Wow! you win!"
        case .start:
            stateLabel.text = "Lock,Scissors,Paper？"
        }
        
        switch playerTurn {
        case .rock:
            rockLabel.isHidden = false
            scissorsLabel.isHidden = true
            paperLabel.isHidden = true
        case .scissors:
            scissorsLabel.isHidden = false
            rockLabel.isHidden = true
            paperLabel.isHidden = true
        case .paper:
            paperLabel.isHidden = false
            rockLabel.isHidden = true
            scissorsLabel.isHidden = true
        }
        playAgainLabel.isHidden = false
    }
    @IBAction func playAgainButton(_ sender: Any) {
        resetBoard()
    }
    @IBAction func rockButton(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func scissorsButton(_ sender: Any) {
        play(Sign.scissors)
    }
    @IBAction func paperButton(_ sender: Any) {
        play(Sign.paper)
    }
  
    


}

