//
//  GameplaySceneClass.swift
//  CatchNotes
//
//  Created by Sergio Manrique on 3/15/18.
//  Copyright © 2018 smm. All rights reserved.
//

import SpriteKit

class GameplaySceneClass : SKScene {
    
    private var player: Player?
    
    private var center = CGFloat();
    
    private var canMove = false, moveLeft = false
    
    private var itemController = ItemController()
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    override func update(_ currentTime: TimeInterval) {
        managePlayer()
    }
    
    private func initializeGame(){
        player = childNode(withName: "Player") as? Player!
        
        center = self.frame.size.width / self.frame.size.height
        
        Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweennumbers(firstNum: 1, secondNum: 2)), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if location.x > center {
                moveLeft = false
            }else {
                moveLeft = true
            }
        }
        
        canMove = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false
    }
    
    
    private func managePlayer(){
        if canMove{
           player?.move(left: moveLeft)
        }
    }
    
    @objc func spawnItems(){
        self.scene?.addChild(itemController.spawnitems())
    }
    
    
}// class













