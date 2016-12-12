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
import GameKit
let rotateAction = SKAction.rotate(byAngle: 1, duration: 0.3)
let repeatAction = SKAction.repeatForever(rotateAction)
let scaleDown = SKAction.scale(to: 0.2, duration:0.3)
let repeatscale = SKAction.repeatForever(scaleDown)
let repeatscale1 = SKAction.repeatForever(scaleUp)

let title4 = SKLabelNode()
let scaleUp = SKAction.scale(to: 5.0, duration:0.3)

var ril = SKSpriteNode(imageNamed: "leftright")


var titles = SKLabelNode()
var titles2 = SKLabelNode()

var titles3 = SKLabelNode()

var themes:SKNode?
var socialmediaicon:SKSpriteNode?
var mute:SKNode?
var how:SKNode?
var rate:SKSpriteNode?
var audioPlayer = AVAudioPlayer()
var playButton:SKNode?
var leaderBoard: SKSpriteNode?



let liftUp = SKAction.scale(to: 1.18, duration: 0.24)
let dropDown = SKAction.scale(to: 1.0, duration: 0.24)
let both = SKAction.sequence([liftUp, dropDown])

class MainMenuScene: SKScene, GKGameCenterControllerDelegate {
   
    var PointsAudio = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "beep1", ofType: "mp3")!))


    let back = SKSpriteNode(imageNamed: "back")

    var phase = 1
    static let rotateRightName = "RotateRightAction"

    var initsp1 = SKShapeNode(circleOfRadius: 75)
    var initsp2 = SKShapeNode(circleOfRadius: 75)
    var initsp3 = SKShapeNode(circleOfRadius: 75)
    var initsp4 = SKShapeNode(circleOfRadius: 75)
    override func didMove(to view: SKView) {
        
        self.scene?.name = "Scene"
        
        self.scene?.backgroundColor = UIColor(red: 40/255.0, green: 42/255.0, blue: 54/255.0, alpha: alpha)
        


        
        

        setupScene()
        
     
        
           }
    
 
    

    
    
    func music() {
        
        var player = AVAudioPlayer()
        
        let url:URL = Bundle.main.url(forResource: "ColorSwiper", withExtension: "mp3")!
        
        do { player = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil) }
        catch let error as NSError { print(error.description) }
        
        player.numberOfLoops = -1
        player.volume = 3.0
        player.prepareToPlay()
        player.play()
        
    }
    
    func setupScene(){
        playButton =  SKSpriteNode(imageNamed: "TapTap Playbutton")

        playButton?.run(repeatAction)

playButton?.physicsBody?.affectedByGravity = false
    playButton?.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 55)
        
        
        //theme button
        themes = SKSpriteNode(imageNamed: "themesicon")
        themes?.position = CGPoint(x: self.frame.midX + 52.5  , y: self.frame.midY - 295)
       // self.addChild(themes!)
        //mute
        mute = SKSpriteNode(imageNamed: "soundicon")
        mute?.position = CGPoint(x: self.frame.midX + 155 , y: self.frame.midY + 305)
        mute?.run(repeatAction)
        self.addChild(mute!)
        //leaderboard
        leaderBoard = SKSpriteNode(imageNamed: "Leaderboard")
        leaderBoard?.position =  CGPoint(x: self.frame.midX  , y: self.frame.midY - 250)

        self.addChild(leaderBoard!)
        leaderBoard?.run(SKAction.repeatForever(both))

        
        //rate
        rate = SKSpriteNode(imageNamed: "Rate")
        rate?.position = CGPoint(x: self.frame.midX - 145  , y: self.frame.midY - 250)
        self.addChild(rate!)
        rate?.run(SKAction.repeatForever(both))

    // how-to button
        how = SKSpriteNode(imageNamed: "howto")
        how?.position = CGPoint(x: self.frame.midX - 155  , y: self.frame.midY + 305)
        how?.run(repeatAction)
        self.addChild(how!)
        
        //Like on scoial media
        
        socialmediaicon = SKSpriteNode(imageNamed: "likeicon")
        socialmediaicon?.position = CGPoint(x: self.frame.midX + 145  , y: self.frame.midY - 250)
        self.addChild(socialmediaicon!)
        socialmediaicon?.run(SKAction.repeatForever(both))

        //add title
        
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
        title2.text = "SWIPE"
        title2.fontSize = 60
        title2.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 231)
        self.addChild(title2)
        
        
        initsp1.fillColor = UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: 1)
        initsp1.strokeColor = UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: 1)
        initsp1.position = CGPoint(x: self.frame.midX + 70  , y: self.frame.midY + 55  )
        initsp1.glowWidth = 0.5
        initsp1.physicsBody?.affectedByGravity = false
        initsp1.physicsBody?.isDynamic = false
        initsp1.run(repeatAction)
        initsp2.fillColor = UIColor(red: 16/255.0, green: 237/255.0, blue: 23/255.0, alpha: 1)

        initsp2.strokeColor = UIColor(red: 16/255.0, green: 237/255.0, blue: 23/255.0, alpha: 1)

        initsp2.position = CGPoint(x: self.frame.midX - 70 , y: self.frame.midY + 55 )
        initsp2.glowWidth = 0.5
        initsp2.physicsBody?.affectedByGravity = false
        initsp2.physicsBody?.isDynamic = false
        initsp2.run(repeatAction)
        initsp3.fillColor = UIColor(red: 241/255.0, green: 233/255.0, blue: 52/255.0, alpha: 1)

        initsp3.strokeColor = UIColor(red: 241/255.0, green: 233/255.0, blue: 52/255.0, alpha: 1)

        initsp3.position = CGPoint(x: self.frame.midX   , y: self.frame.midY + 125)
        initsp3.glowWidth = 0.5
        initsp3.physicsBody?.affectedByGravity = false
        initsp3.physicsBody?.isDynamic = false
        initsp3.run(repeatAction)
        initsp4.fillColor = UIColor(red: 0/255.0, green: 210/255.0, blue: 222/255.0, alpha: 1)

        initsp4.strokeColor = UIColor(red: 0/255.0, green: 210/255.0, blue: 222/255.0, alpha: 1)

        initsp4.position = CGPoint(x: self.frame.midX  , y: self.frame.midY - 15 )
        initsp4.glowWidth = 0.5
        initsp4.physicsBody?.affectedByGravity = false
        initsp4.physicsBody?.isDynamic = false
        initsp4.run(repeatAction)
        self.addChild(initsp1)
        self.addChild(initsp2)

        self.addChild(initsp3)
        self.addChild(initsp4)
        
        initsp1.run(SKAction.repeatForever(both))
       initsp2.run(SKAction.repeatForever(both))
        initsp3.run(SKAction.repeatForever(both))
        initsp4.run(SKAction.repeatForever(both))

        self.addChild(playButton!)

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
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController!)
    {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        
    }

    
    func shakeCamera(_ layer:SKShapeNode, duration:Float) {
        
        let amplitudeX:Float = 10;
        let amplitudeY:Float = 6;
        let numberOfShakes = duration / 0.04;
        var actionsArray:[SKAction] = [];
        for index in 1...Int(numberOfShakes) {
            let moveX = Float(arc4random_uniform(UInt32(amplitudeX))) - amplitudeX / 2;
            let moveY = Float(arc4random_uniform(UInt32(amplitudeY))) - amplitudeY / 2;
            let shakeAction = SKAction.moveBy(x: CGFloat(moveX), y: CGFloat(moveY), duration: 0.02);
            shakeAction.timingMode = SKActionTimingMode.easeOut;
            actionsArray.append(shakeAction);
            actionsArray.append(shakeAction.reversed());
        }
        
        let actionSeq1 = SKAction.sequence(actionsArray);
        let actionSeq = SKAction.repeatForever(actionSeq1)
        
        layer.run(actionSeq);
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        //   let nodes = nodesAtPoint(location)
        
        for touch in touches {
            let location = touch.location(in: self)
            
         
            
            
            func showLeader() {
                let vc = self.view?.window?.rootViewController
                let gc = GKGameCenterViewController()
                gc.gameCenterDelegate = self
                vc?.present(gc, animated: true, completion: nil)
            }

            
            if phase == 1 && atPoint(location) == leaderBoard{
            
              PointsAudio?.play()
            showLeader()
            
            }
            
            if phase == 1 && atPoint(location) == rate{
            PointsAudio?.play()
            
            UIApplication.shared.openURL(URL(string : "https://itunes.apple.com/app/id1084858704")!)
            
            }
            
            if phase == 1 && atPoint(location) == socialmediaicon{
            PointsAudio?.play()
               UIApplication.shared.openURL(URL(string: "http://vibhugrocks.wix.com/vibell")!)
            }
            
            if phase == 1 && atPoint(location) == mute{
            
                if (BackgroundAudio!.isPlaying == true){
                    BackgroundAudio!.stop()
                    
                }
                else{
                    
                    BackgroundAudio!.play()
                    
                    
                }

            
            }
            
            if phase == 1 && atPoint(location) == how{
                PointsAudio?.play()
                let effectsNode = SKEffectNode()
                let filter = CIFilter(name: "CIGaussianBlur")
                // Set the blur amount. Adjust this to achieve the desired effect
                let blurAmount = 10.0
                filter!.setValue(blurAmount, forKey: kCIInputRadiusKey)
                
                effectsNode.filter = filter
                effectsNode.position = self.view!.center
                effectsNode.blendMode = .alpha
                
                // Create a sprite
     mute?.removeFromParent()
                leaderBoard?.removeFromParent()
                rate?.removeFromParent()
                how?.removeFromParent()
                title.removeFromParent()
                title2.removeFromParent()
                initsp1.removeFromParent()
                initsp2.removeFromParent()
                initsp3.removeFromParent()
                initsp4.removeFromParent()
                playButton?.removeFromParent()
                socialmediaicon?.removeFromParent()
                themes?.removeFromParent()
                effectsNode.addChild(rate!)
                effectsNode.addChild(how!)
                effectsNode.addChild(leaderBoard!)
                effectsNode.addChild(title2)
                effectsNode.addChild(title)
                effectsNode.addChild(initsp1)
                effectsNode.addChild(initsp2)
                effectsNode.addChild(initsp3)
                effectsNode.addChild(initsp4)
                effectsNode.addChild(playButton!)
                
                
                phase = 2
                
                
                titles.fontName = "Avenir Next Bold"
                titles.fontColor = UIColor.white
                titles.fontSize = 35
                titles.position =  CGPoint(x: self.frame.midX  , y: self.frame.midY + 110 )
                titles.text = "How to Play"
                self.addChild(titles)
              
                titles2.fontName = "Avenir Next"
                titles2.fontColor = UIColor.white
                titles2.fontSize = 35
                titles2.position =  CGPoint(x: self.frame.midX  , y: self.frame.midY + 45 )
                titles2.text = "Swipe the colors"
                self.addChild(titles2)
                
                          titles3.fontName = "Avenir Next"
                titles3.fontColor = UIColor.white
                titles3.fontSize = 35
                titles3.position =  CGPoint(x: self.frame.midX  , y: self.frame.midY - 10 )
                titles3.text = "to the correct side"
                self.addChild(titles3)
                

                ril.position = CGPoint(x: self.frame.midX   , y: self.frame.midY - 100 )
                self.addChild(ril)
                
                back.position = CGPoint(x: self.frame.midX   , y: self.frame.midY - 220)
                self.addChild(back)

                
                
                // Add the effects node to the scene
                
       
            }
            
            if atPoint(location) == back && phase == 2{
            
                PointsAudio?.play()
                phase = 1
                self.addChild(mute!)
                self.addChild(rate!)
                self.addChild(how!)
                self.addChild(leaderBoard!)
                self.addChild(title2)
                self.addChild(title)
                self.addChild(initsp1)
                self.addChild(initsp2)
                self.addChild(initsp3)
                self.addChild(initsp4)
                self.addChild(playButton!)
                self.addChild(socialmediaicon!)
                titles.removeFromParent()
                titles2.removeFromParent()
                titles3.removeFromParent()
                back.removeFromParent()
                ril.removeFromParent()
                
                

                
            }
            
            if atPoint(location) == themes && phase == 1 {
            
            
                let transition = SKTransition.crossFade(withDuration: 0.5)
                
                let scene = Themes(size: self.scene!.size)
                scene.scaleMode = SKSceneScaleMode.aspectFill
                
                self.scene!.view!.presentScene(scene, transition: transition)

            
            
            }
            if atPoint(location) == playButton && phase == 1{
                PointsAudio?.play()
                let transition = SKTransition.crossFade(withDuration: 0.5)
                
                let scene = GameScene(size: self.scene!.size)
                scene.scaleMode = SKSceneScaleMode.aspectFill
                
                self.scene!.view!.presentScene(scene, transition: transition)

            
            
            }
    }
    
    }
}
