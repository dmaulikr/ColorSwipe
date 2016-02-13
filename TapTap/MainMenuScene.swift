//
//  MainMenuScene.swift
//  TapTap
//
//  Created by Ramana Gandikota on 2/9/16.
//  Copyright © 2016 VG. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit

var playButton:SKNode?

class MainMenuScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        self.scene?.name = "Scene"
        
        self.scene?.backgroundColor = UIColor(red: 40/255.0, green: 42/255.0, blue: 54/255.0, alpha: alpha)
        
        
        setupScene()
    }
    
    
    func setupScene(){
        playButton =  SKSpriteNode(imageNamed: "TapTap Playbutton")

playButton?.physicsBody?.affectedByGravity = false
    playButton?.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame))
        
    self.addChild(playButton!)
        //add title
        
        let title = SKLabelNode()
        title.fontName = "Avenir Next"
        title.fontColor = UIColor.whiteColor()
        title.text = "COLOR"
        title.fontSize = 60
        title.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 291)
        self.addChild(title)
        
        let title2 = SKLabelNode()
        title2.fontName = "Avenir Next"
        title2.fontColor = UIColor.whiteColor()
        title2.text = "SWIPER"
        title2.fontSize = 60
        title2.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 231)
        self.addChild(title2)
        
        /*let line = SKLabelNode()
        line.fontName = "Avenir New"
        line.fontColor = UIColor.whiteColor()
        line.text = "_______"
        line.fontSize = 40
        line.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 285)
        self.addChild(line)
        */
        
     /*
        var title =  SKSpriteNode(imageNamed: "Untitled drawing (2)")
        
        title.physicsBody?.affectedByGravity = false
        title.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 200)
        
        self.addChild(title)
*/
        
    
}
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        
        
        //   let nodes = nodesAtPoint(location)
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            
            if nodeAtPoint(location) == playButton{
                let transition = SKTransition.crossFadeWithDuration(0.5)
                
                let scene = GameScene(size: self.scene!.size)
                scene.scaleMode = SKSceneScaleMode.AspectFill
                
                self.scene!.view!.presentScene(scene, transition: transition)

            
            
            }
    }
    
    }
}