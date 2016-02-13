//
//  GameScene.swift
//  TapTap
//
//  Created by Ramana Gandikota on 1/25/16.
//  Copyright (c) 2016 VG. All rights reserved.
//

import SpriteKit



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
class GameScene: SKScene {
    var swiper = UISwipeGestureRecognizer()
    var swipe = UISwipeGestureRecognizer()
var xxs = 0
    var xv = 0
    var nodeatpoint: SKNode?
     var tapsprite12 = SKShapeNode(circleOfRadius: 50)
   let scorelabel = SKLabelNode()
    
    var points = 0
    var vectorx:CGFloat = -2
var time = 1.0
var point: CGPoint?
    var barra = SKShapeNode(rectOfSize: CGSize(width: 145, height: 50))

    override func didMoveToView(view: SKView) {

self.scene?.name = "NAME"
        
        
        
        //------------right  swipe gestures in view--------------//
        let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector("rightSwiped"))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view!.addGestureRecognizer(swipeRight)
        
        
        //-----------left swipe gestures in view--------------//
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector("leftSwiped"))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view!.addGestureRecognizer(swipeLeft)
        
        
        
        
        
        
        //set Direction to Left
   
        /* Setup your scene here */
        self.scene?.backgroundColor = UIColor(red: 40/255.0, green: 42/255.0, blue: 54/255.0, alpha: alpha)


        maketapsprites()

    }
    
    
    
    
    
    
    
    func rightSwiped()
    {
        print("right swiped ")
        if phase == 1{
            nodeatpoint!.position = CGPointMake(CGRectGetMidX(self.frame) + 150 , CGRectGetMidY(self.frame) )
        //var n = nodeatpoint as? SKShapeNode
        if (nodeatpoint?.name)! == 1.description{
            
            points++
        
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
            nodeatpoint!.position = CGPointMake(CGRectGetMidX(self.frame) - 150 , CGRectGetMidY(self.frame) )

        if (nodeatpoint?.name)! == 2.description{
            
            points++
            
        }
        else  if (nodeatpoint?.name)! == "NAME"  {
            Gameover = false
        } else {
            
            Gameover = true
            
        }
        }}
    
    
    
    
    
    
 
 func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
        swipeval = "left"
            print("Swipe Left")
        
            let touches = sender.numberOfTouches()

            for touch in 0..<touches{
                let location = sender.locationOfTouch(touch, inView: self.view)
                //Get the node at the location of the touch
                var swipedNode = self.nodeAtPoint(location)
               // print(swipedNode)
            
         
        }
      
        
     }
        if (sender.direction == .Right) {
            print("Swipe Right")
           
        swipeval = "right"
        }

    }
    
    
    func setuphud(){
        
        scorenode.fontName = "Avenir Next Bold"
        scorenode.fontColor = UIColor.whiteColor()
        scorenode.fontSize = 63
        scorenode.position = CGPoint(x:CGRectGetMidX(self.frame) - 185, y:CGRectGetMidY(self.frame) + 325)
        scorenode.text = points.description
        self.addChild(scorenode)

     //   barra.removeFromParent()
        
        scorelabel.removeFromParent()
        scorelabel2.removeFromParent()
        title.removeFromParent()
        title2.removeFromParent()
        retry.removeFromParent()
        
        
           //setup game arrows
  /*  leftarrow.position = CGPointMake(CGRectGetMidX(self.frame) - 140 , CGRectGetMidY(self.frame) )
self.addChild(leftarrow)
        //rightarrow.position = CGPointMake(CGRectGetMidX(self.frame)+140 , CGRectGetMidY(self.frame) )
//self.addChild(rightarrow)
        */
    }
    
    
    func gamestart(){
        //setup main game
        phase = 3
        points = 0
        vectorx = -4
         time = 1
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

        if phase == 3{
            
            rl.position = CGPointMake(CGRectGetMidX(self.frame)   , CGRectGetMidY(self.frame) + 30 )
            
            intro.fontName = "Avenir Next Bold"
            intro.fontColor = UIColor.whiteColor()
            intro.fontSize = 35
            intro.text = "TAP TO START"
            intro.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 180 )
            
            introlabel2.fontName = "Avenir Next"
            introlabel2.fontColor = UIColor.whiteColor()
            introlabel2.fontSize = 25
            introlabel2.text = "Swipe Left OR Swipe Right"
            introlabel2.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 115 )

            
            initsp1.fillColor = mainC1
            initsp1.strokeColor = mainC1
            initsp1.position = CGPointMake(CGRectGetMidX(self.frame) + 135  , CGRectGetMidY(self.frame) + 30 )
            initsp1.glowWidth = 0.5
            initsp1.physicsBody?.affectedByGravity = false
            initsp1.physicsBody?.dynamic = false
            
            initsp2.fillColor = mainC2
            initsp2.strokeColor = mainC2
            initsp2.position = CGPointMake(CGRectGetMidX(self.frame) - 135 , CGRectGetMidY(self.frame) + 30 )
            initsp2.glowWidth = 0.5
            initsp2.physicsBody?.affectedByGravity = false
            initsp2.physicsBody?.dynamic = false

            
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
                s = 0
            }
            
            if valdo == 0{
        var tapsprite1 = SKShapeNode(circleOfRadius: 65)

val =  arc4random_uniform(2) + 1
tapsprite12 = tapsprite1
       
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
       tapsprite1.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 450)
        tapsprite1.glowWidth = 0.5
        tapsprite1.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        tapsprite1.physicsBody?.dynamic = true
        
        tapsprite1.physicsBody?.affectedByGravity = true
        physicsWorld.gravity = CGVectorMake(0, vectorx)
        self.addChild(tapsprite12)
            if vectorx > -30{
        vectorx = vectorx - 2
            }
            if time>0.6{
            time = time - 0.05
            }
            
            
            barra.name = "bar"
            barra.fillColor = UIColor(red: 229/255.0, green: 66/255.0, blue: 66/255.0, alpha: 0.9)
            
            barra.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 300 )
            
            //self.addChild(barra)

            print(tapsprite1.name)
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "maketapsprites", userInfo: nil, repeats: false)
            }
        }}
    
   
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
    
    func checkForTouches(touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        
        let location = touch.locationInNode(self)
        let nodes = nodesAtPoint(location)
        
        for node in nodes {        let location = touch.locationInNode(self)
            if node.isKindOfClass(SKNode.self) {
                
               
                
                var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
                var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
                
                leftSwipe.direction = .Left
                rightSwipe.direction = .Right
                let sprite = node as! SKShapeNode

                view!.addGestureRecognizer(leftSwipe)
                view!.addGestureRecognizer(rightSwipe)

          //  sprite.position = CGPointMake(CGRectGetMidX(self.frame) - 200 , CGRectGetMidY(self.frame) )
                print(sprite)
                
xps = sprite

                
            }
        }
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
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
            maketapsprites()
        }
     //   let nodes = nodesAtPoint(location)
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            if nodeAtPoint(location) == retry && phase == 0{
             
           
        Gameover = false
            valdo = 1
                s = 1
                phase = 1
                scorenode.removeFromParent()
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
    
    
    func GameIsOver(){
    //Hide everything
        phase = 0

        scorenode.hidden = true
        tapsprite12.removeFromParent()
        
               Gameover = false
scorenode.fontSize = 50
        scorenode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 15 )
        
        
        scorelabel.fontColor = UIColor(red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha: alpha)
        scorelabel.fontName = "Avenir Next"
        scorelabel.fontSize = 40
        scorelabel.text = "HIGH SCORE"
        scorelabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 150)
        self.addChild(scorelabel)

      
        scorelabel2.fontColor = UIColor.whiteColor()
        scorelabel2.fontName = "Avenir Next"
        scorelabel2.fontSize = 40
        scorelabel2.text = "SCORE"
        scorelabel2.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        self.addChild(scorelabel2)

                title.fontName = "Avenir Next"
        title.fontColor = UIColor.whiteColor()
        title.text = "COLOR"
        title.fontSize = 60
        title.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 291)
        self.addChild(title)
       
        title2.fontName = "Avenir Next"
        title2.fontColor = UIColor.whiteColor()
        title2.text = "SWIPER"
        title2.fontSize = 60
        title2.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) + 231)
        self.addChild(title2)
        //self.addChild(barra)
        
        retry.physicsBody?.affectedByGravity = false
        retry.position = CGPointMake(CGRectGetMidX(self.frame)  , CGRectGetMidY(self.frame) - 125)
        self.addChild(retry)
        scorenode.hidden = false
scorelabel.hidden = false
        scorelabel2.hidden = false
        title.hidden = false
        title2.hidden = false
        retry.hidden = false
        

    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        for touch in touches {
            let location = touch.locationInNode(self)
        nodeatpoint = self.nodeAtPoint(location)
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
    points++
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        scorenode.text = points.description
        
        

        if Gameover == true{
            valdo = 1
            s = 1
            GameIsOver()
        }
        
     
        
         /*   if !tapsprite1.intersectsNode(tapsprite1.parent!) && counting < 3{
           // print("game over")
       
        }*/
        
        
    }
}
