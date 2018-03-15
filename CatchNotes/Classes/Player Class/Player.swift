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













