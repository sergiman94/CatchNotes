//
//  Player.swift
//  CatchNotes
//
//  Created by Sergio Manrique on 3/15/18.
//  Copyright © 2018 smm. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private var minX = CGFloat(-200), maxX = CGFloat(200)
    
    func initializePlayer(){
        
        name = "Player";
        physicsBody = SKPhysicsBody(circleOfRadius: size.height / 2)
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = ColliderType.PLAYER
        physicsBody?.contactTestBitMask = ColliderType.NOTE_AND_BOMB
        
    }
  
    func move (left: Bool){
        if left{
            position.x -= 15;
            
            if position.x < minX{
                position.x = minX
            }
            
        }else{
            position.x += 15;
            
            if position.x > maxX{
                position.x = maxX
            }
        }
    }
    
    
}// class 













