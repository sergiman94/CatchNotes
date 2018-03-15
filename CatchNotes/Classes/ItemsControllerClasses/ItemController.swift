//
//  ItemController.swift
//  CatchNotes
//
//  Created by Sergio Manrique on 3/15/18.
//  Copyright © 2018 smm. All rights reserved.
//

import SpriteKit


struct ColliderType{
    static let PLAYER: UInt32 = 0
    static let NOTE_AND_BOMB: UInt32 = 1
}

class ItemController {
    
    private var minX = CGFloat(-200), maxX = CGFloat(200)
    
    func spawnitems() -> SKSpriteNode{
        
        let item: SKSpriteNode?
        
        if Int(randomBetweennumbers(firstNum: 0, secondNum: 10)) >= 6 {
            item = SKSpriteNode(imageNamed: "Bomb")
            item!.name = "Bomb"
            item!.setScale(0.6)
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        } else {
            
            let num = Int(randomBetweennumbers(firstNum: 1, secondNum: 7))
            
            item = SKSpriteNode (imageNamed: "Note \(num)")
            item!.name = "Note"
            item!.setScale(0.7)
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        }
        
        item!.physicsBody?.categoryBitMask = ColliderType.NOTE_AND_BOMB
        
        item!.zPosition = 3
        item!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        item!.position.x = randomBetweennumbers(firstNum: minX, secondNum: maxX)
        
        item!.position.y = 500
        
        return item!
    }
    
    
    
    func randomBetweennumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs (firstNum - secondNum) + min(firstNum, secondNum)
        
    }
    
    
    
}// class

