//
//  GameViewController.swift
//  TapTap
//
//  Created by Ramana Gandikota on 1/25/16.
//  Copyright (c) 2016 VG. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import GameKit
import iAd

var interstitialAdView: UIView = UIView()

var BackgroundAudio = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "ColorSwiper", ofType: "mp3")!))

class GameViewController: UIViewController, ADBannerViewDelegate, ADInterstitialAdDelegate {

    var interstitialAd:ADInterstitialAd!
    
    var interstitialAdView: UIView = UIView()
    
    
    func run(){
    
        loadInterstitialAd()
        
        ADBannerView()

        
    
    }
      override func viewDidLoad() {
        super.viewDidLoad()

        var timer = Timer.scheduledTimer(timeInterval: 45, target: self, selector: #selector(GameViewController.run), userInfo: nil, repeats: false)

        loadInterstitialAd()
        
       ADBannerView()
             
        authenticateLocalPlayer()
        
        BackgroundAudio?.numberOfLoops = -1
        //BackgroundAudio!.play()

        
        if let scene = MainMenuScene(fileNamed:"MainMenuScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
        }
    }

    
    
    
    func loadInterstitialAd() {
        
        interstitialAd = ADInterstitialAd()
        
        interstitialAd.delegate = self
        
        
        
        
        
    }
    
    
    
    func interstitialAdWillLoad(_ interstitialAd: ADInterstitialAd!) {
        
        
        
    }
    
    
    
    func interstitialAdDidLoad(_ interstitialAd: ADInterstitialAd!) {
        
        
        
        
        
        
        
        interstitialAdView = ADBannerView()
        
        interstitialAdView.frame = CGRect.zero
        
        self.interstitialAdView.frame = CGRect(x: 0, y: self.view.frame.size.height-self.interstitialAdView.frame.size.height, width: self.interstitialAdView.frame.size.width, height: self.interstitialAdView.frame.size.height)
        
        interstitialAdView.backgroundColor = UIColor.clear
        
        self.view .addSubview(interstitialAdView)
        
        
        
        
        
        interstitialAd.present(in: interstitialAdView)
        
        UIViewController.prepareInterstitialAds()
        
    }
    
    
    
    func interstitialAdActionDidFinish(_ interstitialAd: ADInterstitialAd!) {
        
        interstitialAdView.removeFromSuperview()
        
        
        
    }
    
    
    
    func interstitialAdActionShouldBegin(_ interstitialAd: ADInterstitialAd!, willLeaveApplication willLeave: Bool) -> Bool {
        
        return true
        
    }
    
    
    
    func interstitialAd(_ interstitialAd: ADInterstitialAd!, didFailWithError error: Error!) {
        print(" iAds Did Fail with Error")
        
        
    }
    
    
    
    func interstitialAdDidUnload(_ interstitialAd: ADInterstitialAd!) {
        
        interstitialAdView.removeFromSuperview()
        
    }

    
    func authenticateLocalPlayer(){
        
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            
            if (viewController != nil) {
                self.present(viewController!, animated: true, completion: nil)
            }
                
            else {
                print((GKLocalPlayer.localPlayer().isAuthenticated))
            }
        }}

    
    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
