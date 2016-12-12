//
//  GameScene.swift
//  TapTap
//
//  Created by Ramana Gandikota on 1/25/16.
//  Copyright (c) 2016 VG. All rights reserved.
//

import SceneKit
import SpriteKit
import UIKit
import AVFoundation
import GameKit
import iAd


var ranval = 0
var ButtonAudioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "ButtonAudio", ofType: "mp3")!))


var PointsAudio = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "beep1", ofType: "mp3")!))

var phasex = 0
var pausedlabel = SKLabelNode()
var pause = SKSpriteNode(imageNamed: "pauseicon")

let canvas = SKSpriteNode();
var initialPosition:CGPoint?;
var tap2 = SKShapeNode()
var initsp1 = SKShapeNode(circleOfRadius: 65)
var initsp2 = SKShapeNode(circleOfRadius: 65)
var intro = SKLabelNode()
var introlabel2 = SKLabelNode()
 var mainC2 = color1
var mainC1 = color1
var retry = SKSpriteNode(imageNamed: "unnamed")
var rl = SKSpriteNode(imageNamed: "leftright")

let scorelabel2 = SKLabelNode()
let title = SKLabelNode()

let title2 = SKLabelNode()
var color1 = UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: 1)
var color2 = UIColor(red: 16/255.0, green: 237/255.0, blue: 23/255.0, alpha: 1)
var color3 = UIColor(red: 241/255.0, green: 233/255.0, blue: 52/255.0, alpha: 1)
var color4 = UIColor(red: 0/255.0, green: 210/255.0, blue: 222/255.0, alpha: 1)
var colors = [ "UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: alpha)",
    "UIColor(red: 0/255.0, green: 255/255.0, blue: 0/255.0, alpha: alpha)", "UIColor(red: 241/255.0, green: 233/255.0, blue: 52/255.0, alpha: alpha)",
    "UIColor(red: 0/255.0, green: 210/255.0, blue: 222/255.0, alpha: alpha)"
]

let highlabel = SKLabelNode()

var phase = 1
var s = 1
var swipeval = ""
var valdo = 1
var Gameover = false
var val:UInt32 = 0
var val1:UInt32 = 0
var val2:UInt32 = 0

var xps = SKShapeNode()
var x = 0
var nodetouch = SKNode()
var scorenode = SKLabelNode()
class GameScene: SKScene, GKGameCenterControllerDelegate {
    
    var rate:SKNode?

    

    var leaderBoard: SKNode?
    
    var swiper = UISwipeGestureRecognizer()
    var swipe = UISwipeGestureRecognizer()
var xxs = 0
    var xv = 0
    var nodeatpoint: SKNode?
     var tapsprite12 = SKShapeNode(circleOfRadius: 50)
   let scorelabel = SKLabelNode()
    var home:SKNode?
    var points = 0
    var vectorx:CGFloat = -2
var time = 1.0
var point: CGPoint?
    var barra = SKShapeNode(rectOf: CGSize(width: 145, height: 50))

    
    override func didMove(to view: SKView) {

        

        
self.scene?.name = "NAME"
        
        leaderBoard = SKSpriteNode(imageNamed: "Leaderboard")
        
        rate = SKSpriteNode(imageNamed: "Rate")

        home = SKSpriteNode(imageNamed: "house")
        //------------right  swipe gestures in view--------------//
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.rightSwiped))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view!.addGestureRecognizer(swipeRight)
        
        
        //-----------left swipe gestures in view--------------//
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.leftSwiped))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view!.addGestureRecognizer(swipeLeft)
        
        
        
        
        
        
        //set Direction to Left
   
        /* Setup your scene here */
        self.scene?.backgroundColor = UIColor(red: 40/255.0, green: 42/255.0, blue: 54/255.0, alpha: alpha)


        maketapsprites()

        retry.run(repeatAction)

    }
    
    
    
    //camera shake
    func shakeCamera(_ duration:Float) {
        let amplitudeX:Float = 10;
        let amplitudeY:Float = 6;
        let numberOfShakes = duration / 0.04;
        var actionsArray:[SKAction] = [];
        for index in 1...Int(numberOfShakes) {
            // build a new random shake and add it to the list
            let moveX = CGFloat(arc4random_uniform(10) + 1)
            let moveY = CGFloat(arc4random_uniform(6) + 1)


            let shakeAction = SKAction.moveBy(x: moveX, y: moveY, duration: 0.02);
            shakeAction.timingMode = SKActionTimingMode.easeOut;
            actionsArray.append(shakeAction);
            actionsArray.append(shakeAction.reversed());
        }
        
        let actionSeq = SKAction.sequence(actionsArray);
        canvas.run(actionSeq);
    }

    
    
    
    
    func rightSwiped()
    {
        print("right swiped ")
        if phase == 1{
            nodeatpoint!.position = CGPoint(x: self.frame.midX + 135 , y: self.frame.midY )
        //var n = nodeatpoint as? SKShapeNode
        if (nodeatpoint?.name)! == 1.description{
            
            points += 1
            PointsAudio?.play()
        
        }
         else  if (nodeatpoint?.name)! == "NAME"  {
        Gameover = false
        } else {
        
            Gameover = true

        }
        }}

    
    
    func leftSwiped()
    {  print("left swiped")
        if phase == 1{
            nodeatpoint!.position = CGPoint(x: self.frame.midX - 135 , y: self.frame.midY )

        if (nodeatpoint?.name)! == 2.description{
            
            points += 1
            PointsAudio?.play()
            
        }
        else  if (nodeatpoint?.name)! == "NAME"  {
            Gameover = false
        } else {
            
            Gameover = true
            
        }
        }}
    
    
    
    
    
    
 
 func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
        swipeval = "left"
            print("Swipe Left")
        
            let touches = sender.numberOfTouches

            for touch in 0..<touches{
                let location = sender.location(ofTouch: touch, in: self.view)
                //Get the node at the location of the touch
                var swipedNode = self.atPoint(location)
               // print(swipedNode)
            
         
        }
      
        
     }
        if (sender.direction == .right) {
            print("Swipe Right")
           
        swipeval = "right"
        }

    }
    
    
    func setuphud(){
        
        scorenode.fontName = "Avenir Next Bold"
        scorenode.fontColor = UIColor.white
        scorenode.fontSize = 63
        scorenode.position = CGPoint(x:self.frame.midX - 185, y:self.frame.midY + 325)
        scorenode.text = points.description
scorenode.isHidden = true
        
     //   barra.removeFromParent()
        
        scorelabel.removeFromParent()
        scorelabel2.removeFromParent()
        title.removeFromParent()
        title2.removeFromParent()
        retry.removeFromParent()
        leaderBoard?.removeFromParent()
        rate?.removeFromParent()
        home?.removeFromParent()
        mute?.removeFromParent()
        highlabel.removeFromParent()
           //setup game arrows
  /*  leftarrow.position = CGPointMake(CGRectGetMidX(self.frame) - 140 , CGRectGetMidY(self.frame) )
self.addChild(leftarrow)
        //rightarrow.position = CGPointMake(CGRectGetMidX(self.frame)+140 , CGRectGetMidY(self.frame) )
//self.addChild(rightarrow)
        */
    }
    
    func randvals(){
    
        //which 2 colors ???
        val1 = arc4random_uniform(4) + 1
        val2 = arc4random_uniform(4) + 1
        
        if val1 == 1{
            mainC1 = color1
        } else if val1 == 2{
            mainC1 = color2
            
        } else if val1 == 3{
            mainC1 = color3
            
        } else if val1 == 4{
            mainC1 = color4
            
        }
        
        if val2 == 1{
            mainC2 = color1
        } else if val2 == 2{
            mainC2 = color2
            
        } else if val2 == 3{
            mainC2 = color3
            
        } else if val2 == 4{
            mainC2 = color4
            
        }

        if mainC1 == mainC2{
        randvals()
        
        }
    
    
    }
    
    func gamestart(){
        //setup main game
        phase = 3
        points = 0
        vectorx = -4
         time = 1
        
       randvals()
        
        
        if phase == 3{
            
            rl.position = CGPoint(x: self.frame.midX   , y: self.frame.midY + 30 )
            
            intro.fontName = "Avenir Next Bold"
            intro.fontColor = UIColor.white
            intro.fontSize = 35
            intro.text = "TAP TO START"
            intro.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 180 )
            
            introlabel2.fontName = "Avenir Next"
            introlabel2.fontColor = UIColor.white
            introlabel2.fontSize = 25
            introlabel2.text = "Swipe Left OR Swipe Right"
            introlabel2.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 115 )

            
            initsp1.fillColor = mainC1
            initsp1.strokeColor = mainC1
            initsp1.position = CGPoint(x: self.frame.midX + 135  , y: self.frame.midY + 30 )
            initsp1.glowWidth = 0.5
            initsp1.physicsBody?.affectedByGravity = false
            initsp1.physicsBody?.isDynamic = false
            
            initsp2.fillColor = mainC2
            initsp2.strokeColor = mainC2
            initsp2.position = CGPoint(x: self.frame.midX - 135 , y: self.frame.midY + 30 )
            initsp2.glowWidth = 0.5
            initsp2.physicsBody?.affectedByGravity = false
            initsp2.physicsBody?.isDynamic = false

            
            self.addChild(initsp1)
            self.addChild(initsp2)
            self.addChild(intro)
            self.addChild(rl)
            self.addChild(introlabel2)
            
            
        
        }
        
setuphud()
    }
    
    
    
    
    
   
    func maketapsprites(){
        if phase == 1{
            
            if s == 1{
                gamestart()
                pause.position = CGPoint(x:self.frame.midX + 170, y:self.frame.midY + 325)
                
                //self.addChild(pause)

                s = 0
            }
            
            if valdo == 0{
        let tapsprite1 = SKShapeNode(circleOfRadius: 65)
                val =  arc4random_uniform(2) + 1

tapsprite12 = tapsprite1
       
                if scorenode.isHidden == true{
                    self.addChild(scorenode)
scorenode.isHidden = false
                
                }
                
            if val == 1{
                tapsprite1.fillColor = mainC1
                tapsprite1.strokeColor = mainC1
            } else if val == 2{
                tapsprite1.fillColor = mainC2
                tapsprite1.strokeColor = mainC2

            }

        
        // 250, -250
        //155, -155
        tapsprite1.name = val.description
            
        tapsprite1.removeFromParent()
       tapsprite1.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 450)
        tapsprite1.glowWidth = 0.5
        tapsprite1.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        tapsprite1.physicsBody?.isDynamic = true
        
        tapsprite1.physicsBody?.affectedByGravity = true
        physicsWorld.gravity = CGVector(dx: 0, dy: vectorx)
        self.addChild(tapsprite12)
                ranval += 1
            if vectorx > -30{
        vectorx = vectorx - 2
            }
            if time>0.6{
            time = time - 0.05
            }
            
            
            barra.name = "bar"
            barra.fillColor = UIColor(red: 229/255.0, green: 66/255.0, blue: 66/255.0, alpha: 0.9)
            
            barra.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 300 )
            
            //self.addChild(barra)

            print(tapsprite1.name)
            
                
            var timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(GameScene.maketapsprites), userInfo: nil, repeats: false)
            }
        }}
    
   
    func showLeader() {
        let vc = self.view?.window?.rootViewController
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        vc?.present(gc, animated: true, completion: nil)
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController!)
    {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        
    }

    /*func spritemake2(){
        
            var tapsprite2 = SKShapeNode(circleOfRadius: 50)
      tapsprite2 = tapsprite21

        tapsprite2.fillColor = UIColor .whiteColor()
        tapsprite2.strokeColor = UIColor .whiteColor()
        // 250, -250
        //155, -155
        tapsprite2.removeFromParent()
        tapsprite2.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 200)
        tapsprite2.glowWidth = 0.5
        tapsprite2.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        tapsprite2.physicsBody?.dynamic = true
      
        tapsprite2.physicsBody?.affectedByGravity = true
        physicsWorld.gravity = CGVectorMake(0, -0.3)
        self.addChild(tapsprite2)
      //var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "maketapsprites", userInfo: nil, repeats: true)
        
    }*/
    
    func checkForTouches(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        let nodes = self.nodes(at: location)
        
        for node in nodes {        let location = touch.location(in: self)
            if node.isKind(of: SKNode.self) {
                
               
                
                let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.handleSwipes(_:)))
                let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.handleSwipes(_:)))
                
                leftSwipe.direction = .left
                rightSwipe.direction = .right
                let sprite = node as! SKShapeNode

                view!.addGestureRecognizer(leftSwipe)
                view!.addGestureRecognizer(rightSwipe)

          //  sprite.position = CGPointMake(CGRectGetMidX(self.frame) - 200 , CGRectGetMidY(self.frame) )
                print(sprite)
                
xps = sprite

                
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        guard let touch = touches.first else { return }

        
        
        
        
        if phase == 3{
        initsp1.removeFromParent()
            initsp2.removeFromParent()
            intro.removeFromParent()
            rl.removeFromParent()
            introlabel2.removeFromParent()
    valdo = 0
        phase = 1
            shakeCamera(3.0)
            maketapsprites()
        }
     //   let nodes = nodesAtPoint(location)
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location) == home && phase == 0{
            
                let transition = SKTransition.crossFade(withDuration: 0.5)
                
                let scene = MainMenuScene(size: self.scene!.size)
                scene.scaleMode = SKSceneScaleMode.aspectFill
                
                self.scene!.view!.presentScene(scene, transition: transition)

                Gameover = false
                valdo = 1
                s = 1
                phase = 1
                scorenode.removeFromParent()

            
                
            }
            
            
            if phase == 0 && atPoint(location) == leaderBoard{
            
            showLeader()
                
            }
            
            if phase == 0 && atPoint(location) == mute{
                
                if (BackgroundAudio!.isPlaying == true){
                    BackgroundAudio!.stop()
                    
                }
                else{
                    
                    BackgroundAudio!.play()
                    
                    
                }
                
                
            }

            
           /* if phase == 1 && nodeAtPoint(location) == pause{
            
                tapsprite12.hidden = true
                scorenode.hidden = true
                pause.hidden = true
                
                playButton =  SKSpriteNode(imageNamed: "TapTap Playbutton")
                BackgroundAudio?.pause()
                playButton?.physicsBody?.affectedByGravity = false
                playButton?.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame))
                self.addChild(playButton!)
                pausedlabel.fontColor = UIColor.whiteColor()
                pausedlabel.fontName = "Avenir Next Bold"
                pausedlabel.fontSize = 45
                pausedlabel.text = "PAUSED"
                pausedlabel.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 150)
                self.addChild(pausedlabel)
                
          
                
                self.paused = true
                phasex = 5
            
                
                
            
            }
            
            
            if phasex == 5 && nodeAtPoint(location) == playButton{
                tapsprite12.hidden = false
                scorenode.hidden = false
                pause.hidden = false
            BackgroundAudio?.play()
            playButton?.removeFromParent()
                pausedlabel.removeFromParent()
                self.paused = false
            
            
            }
            */
            
            
            if phase == 0 && atPoint(location) == rate {
            
                UIApplication.shared.openURL(URL(string : "https://itunes.apple.com/app/id1084858704")!)

                
            
            }
            
            
            if atPoint(location) == retry && phase == 0{
             
           
        Gameover = false
            valdo = 1
                s = 1
                phase = 1
                
                scorenode.removeFromParent()
                PointsAudio?.play()
                maketapsprites()
   
            }
    /*        var swipedNode = self.nodeAtPoint(location)
            print(swipedNode)
            swipedNode.position = CGPointMake(CGRectGetMidX(self.frame) + 200  , CGRectGetMidY(self.frame))
            if self.nodeAtPoint(location) == leftarrow && xv == 1{
            
            
            
           print("leftin")
            }
            
        
            let touchLocation = touch.locationInNode(self)
            
            if touchLocation.x < self.frame.size.width / 2 {
     print("yo")
                //physicsWorld.gravity = CGVectorMake(-10, vectorx)
            } else {
                print("yo2")
               // physicsWorld.gravity = CGVectorMake(10, vectorx)

                            }
        
        }
            /*if location == point{
                print("noice")
            }
            */*/
            }
        }
    
    func shakeCamera(_ layer:SKSpriteNode, duration:Float) {
        
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
        
        let actionSeq = SKAction.sequence(actionsArray);
        layer.run(actionSeq);
    }
    
    func saveHighscore(_ score:Int) {
        
        //check if user is signed in
        if GKLocalPlayer.localPlayer().isAuthenticated {
            
            let scoreReporter = GKScore(leaderboardIdentifier: "ColorSlidingID") //leaderboard id here
            
            scoreReporter.value = Int64(points) //score variable here (same as above)
            
            let scoreArray: [GKScore] = [scoreReporter]
            var error:NSError
            GKScore.report(scoreArray, withCompletionHandler: { (error) -> Void in
print("error" )
            })
            
            
                    }
        
    }
    let defaults = UserDefaults()


    func GameIsOver(){
        // HIgh SCORE
        let highscore = defaults.integer(forKey: "highscore")

        if(points>highscore)
        {
            defaults.set(points, forKey: "highscore")
            
            saveHighscore(points)
            
        }
        let highscoreshow = defaults.integer(forKey: "highscore")

        
        
        
        
        
        
        
        
    //Hide everything
        phase = 0

        scorenode.isHidden = true
        tapsprite12.removeFromParent()
        childNode(withName: 1.description)?.removeFromParent()
        childNode(withName: 2.description)?.removeFromParent()

               Gameover = false
scorenode.fontSize = 50
        scorenode.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 5 )
        
        highlabel.fontColor = UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: alpha)
        highlabel.fontName = "Avenir Next Bold"
        highlabel.fontSize = 50
        highlabel.text = highscoreshow.description
        highlabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 107.5 )
        self.addChild(highlabel)
        

        scorelabel.fontColor = UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: alpha)
        scorelabel.fontName = "Avenir Next"
        scorelabel.fontSize = 40
        scorelabel.text = "HIGH SCORE"
        scorelabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 165)
        self.addChild(scorelabel)

      
        scorelabel2.fontColor = UIColor.white
        scorelabel2.fontName = "Avenir Next"
        scorelabel2.fontSize = 40
        scorelabel2.text = "SCORE"
        scorelabel2.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 55)
        self.addChild(scorelabel2)

                title.fontName = "Avenir Next"
        title.fontColor = UIColor.white
        title.text = "COLOR"
        title.fontSize = 60
        title.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 291)
        self.addChild(title)
       
        title2.fontName = "Avenir Next"
        title2.fontColor = UIColor.white
        title2.text = "SWIPE"
        title2.fontSize = 60
        title2.position = CGPoint(x: self.frame.midX  , y: self.frame.midY + 231)
        self.addChild(title2)
        //self.addChild(barra)
        
        retry.physicsBody?.affectedByGravity = false
        retry.position = CGPoint(x: self.frame.midX  , y: self.frame.midY - 95)
        self.addChild(retry)
        scorenode.isHidden = false
scorelabel.isHidden = false
        scorelabel2.isHidden = false
        title.isHidden = false
        title2.isHidden = false
        retry.isHidden = false
        
        leaderBoard?.position =  CGPoint(x: self.frame.midX  , y: self.frame.midY - 250)
        self.addChild(leaderBoard!)
        leaderBoard?.run(SKAction.repeatForever(both))

        
        //rate
               rate?.position = CGPoint(x: self.frame.midX - 145  , y: self.frame.midY - 250)
        self.addChild(rate!)
        rate?.run(SKAction.repeatForever(both))

        
        home?.position = CGPoint(x: self.frame.midX + 145  , y: self.frame.midY - 250)
        self.addChild(home!)
        home?.run(SKAction.repeatForever(both))

             //mute
        mute = SKSpriteNode(imageNamed: "soundicon")
        mute?.position = CGPoint(x: self.frame.midX + 155 , y: self.frame.midY + 305)
        mute?.run(repeatAction)
        self.addChild(mute!)

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        for touch in touches {
            let location = touch.location(in: self)
        nodeatpoint = self.atPoint(location)
         /*   checkForTouches(touches)
            if self.nodeAtPoint(location) == tapsprite12{
              

                if swipeval == "left"{
                    if xps.fillColor == UIColor.whiteColor(){
                        xps.position = CGPointMake(CGRectGetMidX(self.frame) - 150, CGRectGetMidY(self.frame) )
                    points++
                    } else{
                    
                    Gameover = true
                    }
                }
                if swipeval == "right"{
                    if xps.fillColor == UIColor.blackColor(){
                    xps.position = CGPointMake(CGRectGetMidX(self.frame) + 150, CGRectGetMidY(self.frame) )
                    points++
                    } else {
                    
                    Gameover = true
                    }
                
                }
            }*/
        }}
    func addpoint(){
    points += 1
    }
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        scorenode.text = points.description
      
       let location = CGPoint(x: self.frame.midX  , y: self.frame.midY - 485)
        let location2 = CGPoint(x: self.frame.midX + 150  , y: self.frame.midY - 450)
        let location3 = CGPoint(x: self.frame.midX - 150  , y: self.frame.midY - 450)

        
      //  if phase == 1{
        
if atPoint(location) == childNode(withName: 1.description) {

                
                Gameover = true
                
            }
        if  atPoint(location) == childNode(withName: 2.description){
        
        Gameover = true
        }
       
      
        atPoint(location2).removeFromParent()
        atPoint(location3).removeFromParent()

       // }

       /* var xn = SKNode()
        xn = nodeAtPoint(location)
        if self.scene!.frame.intersects(nodeAtPoint(location).frame) {
            if nodeAtPoint(location).name ==
        }
        */
              if Gameover == true{
            ButtonAudioPlayer!.play()
                
            valdo = 1
            s = 1
            GameIsOver()
        }
        
     
        
        
        
    }
}
