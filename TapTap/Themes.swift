//
//  Themes.swift
//  TapTap
//
//  Created by Ramana Gandikota on 2/14/16.
//  Copyright © 2016 VG. All rights reserved.
//

import UIKit
import SpriteKit

let back = SKSpriteNode(imageNamed: "backicon")


class Themes: SKScene {

    override func didMove(to view: SKView) {
        self.scene?.name = "Scene"
        
        self.scene?.backgroundColor = UIColor(red: 40/255.0, green: 42/255.0, blue: 54/255.0, alpha: alpha)
        

        let title = SKLabelNode()
        title.fontName = "Avenir Next"
        title.fontColor = UIColor.white
        title.text = "COLOR"
        title.fontSize = 60
        title.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 291)
        self.addChild(title)
        
        let title2 = SKLabelNode()
        title2.fontName = "Avenir Next"
        title2.fontColor = UIColor.white
        title2.text = "SWIPER"
        title2.fontSize = 60
        title2.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 231)
        self.addChild(title2)

    
        let title3 = SKLabelNode()
        title3.fontName = "Avenir Next Bold"
        title3.fontColor = UIColor.white
        title3.text = "THEMES"
        title3.fontSize = 60
        title3.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 120)
        self.addChild(title3)
        
        back.position = CGPoint(x: self.frame.midX - 165  , y: self.frame.midY + 305)
        self.addChild(back)
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        //   let nodes = nodesAtPoint(location)
        
        for touch in touches {
            let location = touch.location(in: self)

            
            if atPoint(location) == back{
                let transition = SKTransition.crossFade(withDuration: 0.5)
                
                let scene = MainMenuScene(size: self.scene!.size)
                scene.scaleMode = SKSceneScaleMode.aspectFill
                
                self.scene!.view!.presentScene(scene, transition: transition)

            
            
            }

        }}
    
    
    
    
}
