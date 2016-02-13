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
import AVFoundation

var how:SKNode?
var rate:SKNode?
var audioPlayer = AVAudioPlayer()
var playButton:SKNode?
var leaderBoard: SKNode?
class MainMenuScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        self.scene?.name = "Scene"
        
        self.scene?.backgroundColor = UIColor(red: 40/255.0, green: 42/255.0, blue: 54/255.0, alpha: alpha)
        
        
        setupScene()
        
        
           }
    
    
    func music() {
        
        var player = AVAudioPlayer()
        
        let url:NSURL = NSBundle.mainBundle().URLForResource("Dream TOM GARNETT", withExtension: "m4a")!
        
        do { player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) }
        catch let error as NSError { print(error.description) }
        
        player.numberOfLoops = -1
        player.volume = 3.0
        player.prepareToPlay()
        player.play()
        
    }
    
    func setupScene(){
        playButton =  SKSpriteNode(imageNamed: "TapTap Playbutton")

playButton?.physicsBody?.affectedByGravity = false
    playButton?.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame))
        
    self.addChild(playButton!)
        
        //buttons ; leader board, rate, how-to
        
        //leaderboard
        leaderBoard = SKSpriteNode(imageNamed: "Leaderboard")
        leaderBoard?.position =  CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) - 275)

        self.addChild(leaderBoard!)
        
        //rate
        rate = SKSpriteNode(imageNamed: "Rate")
        rate?.position = CGPointMake(CGRectGetMidX(self.frame) - 145  , CGRectGetMidY(self.frame) - 275)
        self.addChild(rate!)
    // how-to button
        how = SKSpriteNode(imageNamed: "questionmark")
        how?.position = CGPointMake(CGRectGetMidX(self.frame) + 145  , CGRectGetMidY(self.frame) - 275)
        self.addChild(how!)

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