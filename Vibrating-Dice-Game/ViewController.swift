//
//  ViewController.swift
//  Vibrating-Dice-Game
//
//  Created by halil ibrahim baykan on 20/06/2020.
//  Copyright © 2020 halil ibrahim baykan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstPlayerScoreLabel: UILabel!
    @IBOutlet weak var secondPlayerScoreLabel: UILabel!
    @IBOutlet weak var firstPlayerPointLabel: UILabel!
    @IBOutlet weak var secondPlayerPointLabel: UILabel!
    @IBOutlet weak var firstPlayerPosition: UIImageView!
    @IBOutlet weak var secondPlayerPosition: UIImageView!
    @IBOutlet weak var firstDiceImage: UIImageView!
    @IBOutlet weak var secondDiceImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var playersPoints = (firstPlayerPoint : 0 ,secondPlayerPoint : 0)
    var playersScores = (firstPlayerScore : 0 , secondPlayerScore : 0)
    var playerTurn : Int = 1
    
    var maxSetNumber: Int = 5
    var currentSet : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let background = UIImage(named: "arkaPlan"){
            self.view.backgroundColor = UIColor(patternImage: background)
        }
 
    }
    
//    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//
//    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        print("shaked")
        
        createDiceValue()
    }

    func createDiceValue(){
        
        let dice1 = arc4random_uniform(6)+1 //-> it starts 0 that's why we add 1
        let dice2 = arc4random_uniform(6)+1
        
        firstDiceImage.image = UIImage(named: String(dice1))
        secondDiceImage.image = UIImage(named: String(dice2))
        
        resultOfSet(dice1: Int(dice1), dice2: Int(dice2))
    }
    
    func resultOfSet(dice1: Int, dice2: Int){
        
        if playerTurn == 1 {
            
            playersPoints.firstPlayerPoint = dice1 + dice2
            firstPlayerPointLabel.text = String(playersPoints.firstPlayerPoint)
            firstPlayerPosition.image = UIImage(named: "bekle")
            secondPlayerPosition.image = UIImage(named: "onay")
            resultLabel.text = "2. player turn"
            playerTurn = 2
            secondPlayerPointLabel.text = "0"
    
        }else{
            
            playersPoints.secondPlayerPoint = dice1 + dice2
            secondPlayerPointLabel.text = String(playersPoints.secondPlayerPoint)
            secondPlayerPosition.image = UIImage(named: "bekle")
            firstPlayerPosition.image = UIImage(named: "onay")
            playerTurn = 1
          
            if playersPoints.firstPlayerPoint > playersPoints.secondPlayerPoint {
                
                playersScores.firstPlayerScore += 1
                resultLabel.text = "\(currentSet) of set 1. player Win!"
                firstPlayerScoreLabel.text = String(playersScores.firstPlayerScore)
            }else if playersPoints.firstPlayerPoint < playersPoints.secondPlayerPoint{
                playersScores.secondPlayerScore += 1
                resultLabel.text = "\(currentSet) of set 2. player Win!"
                secondPlayerScoreLabel.text = String(playersScores.secondPlayerScore)
                currentSet += 1
                
            }else{
                // here is tie situation
                // we shouldn't change the number of set
                
                resultLabel.text = "\(currentSet) of set is Tie!"
                
                
            }

        }
        
        
        
        
        
    }
    
    
    
    
    
}

