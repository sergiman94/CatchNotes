//
//  GameplaySceneClass.swift
//  CatchNotes
//
//  Created by Sergio Manrique on 3/15/18.
//  Copyright © 2018 smm. All rights reserved.
//

import SpriteKit

class GameplaySceneClass : SKScene, SKPhysicsContactDelegate {
    
    private var player: Player?
    
    private var center = CGFloat();
    
    private var canMove = false, moveLeft = false
    
    private var itemController = ItemController()
    
    private var scoreLabel = SKLabelNode()
    private var score = 0
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    override func update(_ currentTime: TimeInterval) {
        managePlayer()
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Player"{
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Note"{
            
            score += 1
            scoreLabel.text = String(score)
            secondBody.node?.removeFromParent()
            
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Bomb"{
            firstBody.node?.removeFromParent()
            secondBody.node?.removeFromParent()
            
            Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(GameplaySceneClass.restartGame), userInfo: nil, repeats: false)
        }
        
    }
    
    private func initializeGame(){
        
        physicsWorld.contactDelegate = self
        
        player = childNode(withName: "Player") as? Player!
        player?.initializePlayer()
        
        scoreLabel = (childNode(withName: "ScoreLabel") as? SKLabelNode!)!
        
        center = self.frame.size.width / self.frame.size.height
        
        Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweennumbers(firstNum: 1, secondNum: 2)), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(7), target: self, selector: #selector(GameplaySceneClass.removeItems), userInfo: nil, repeats: true)
        
    }
    
    
    private func managePlayer(){
        if canMove{
           player?.move(left: moveLeft)
        }
    }
    
    @objc func spawnItems(){
        self.scene?.addChild(itemController.spawnitems())
    }
    
    
    @objc func restartGame(){
        
        if let scene = GameplaySceneClass(fileNamed: "GameplayScene"){
            
            scene.scaleMode = .aspectFill
            
            view?.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
        }
    }
    
    @objc func removeItems(){
        
        for child in children{
            if child.name == "Note" || child.name == "Bomb" {
                if child.position.y < -self.scene!.frame.height - 100 {
                    
                    child.removeFromParent()
                    
                }
            }
        }
    }
    
}// class













