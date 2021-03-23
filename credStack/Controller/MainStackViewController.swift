//
//  ViewController.swift
//  credStack
//
//  Created by Rushabh Singh on 22/03/21.
//  Copyright © 2021 Rushabh Singh. All rights reserved.
//

import UIKit

protocol CollapsedViewProtocol : AnyObject {
    func collapsedViewClicked(currentId : PlayerID)
}

class MainStackViewController: UIViewController, CollapsedViewProtocol {
    
    @IBOutlet weak var ctaButton: UIButton!
    @IBOutlet weak var scrollableContentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollableContentView: UIView!
    @IBOutlet weak var mainContentView: UIView!
    var firstView = DynamicView()
    var secondView = DynamicView()
    var thirdView = DynamicView()
    let players = PlayerInfo()
    var frame : CGRect = CGRect()
    var currentPlayerId : PlayerID = PlayerID.SOURAV_ID
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviews()
        self.showOnlyFirstView()
        self.updateCTAButtonText()
    }
    
    func addSubviews(){
        addFirstView()
        addSecondView()
        addThirdView()
    }
    
    func addFirstView(){
        firstView.collapsedViewDelegate = self
        firstView.frame = CGRect(x: LEFT_PADDING, y: VERTICAL_PADDING, width: self.view.frame.size.width - 2*LEFT_PADDING , height: DEFAULT_HEIGHT)
        firstView.setPlayerDataFor(playerId: currentPlayerId)
        firstView.frame.size.height = firstView.getHeightOfExpandedView() + VERTICAL_PADDING
        self.scrollableContentView.addSubview(firstView)
    }
    
    func addSecondView(){
        secondView.collapsedViewDelegate = self
        secondView.frame = CGRect(x: LEFT_PADDING, y: firstView.frame.origin.y +  firstView.collapsedView.frame.size.height + VERTICAL_PADDING, width: self.view.frame.size.width - 2*LEFT_PADDING , height: DEFAULT_HEIGHT)
        secondView.setPlayerDataFor(playerId: PlayerID.MS_DHONI_ID)
        secondView.frame.size.height = secondView.getHeightOfExpandedView() + VERTICAL_PADDING
        self.scrollableContentView.addSubview(secondView)
    }
    
    func addThirdView(){
        thirdView.collapsedViewDelegate = self
        thirdView.frame = CGRect(x: LEFT_PADDING, y:secondView.frame.origin.y +  secondView.collapsedView.frame.size.height + VERTICAL_PADDING, width: self.view.frame.size.width - 2*LEFT_PADDING , height: DEFAULT_HEIGHT)
        thirdView.setPlayerDataFor(playerId: PlayerID.VIRAT_ID)
        thirdView.frame.size.height = thirdView.getHeightOfExpandedView()
        self.scrollableContentView.addSubview(thirdView)
    }
    
    func collapsedViewClicked(currentId : PlayerID){
        switch currentId {
        case PlayerID.SOURAV_ID:
            self.showOnlyFirstView()
            
        case PlayerID.MS_DHONI_ID:
            //show second view with first collapsed and third hidden
            self.showSecondViewExpanded()
            
        default:
            //show first view only
            self.showOnlyFirstView()
        }
        self.updateCTAButtonText()
    }
    
    @IBAction func ctaButtonClicked(_ sender: Any) {
        switch currentPlayerId {
        case PlayerID.SOURAV_ID:
            //show second view with first collapsed and third hidden
            self.showSecondViewExpanded()
            
        case PlayerID.MS_DHONI_ID:
            //show third view with first and second collapsed
            
            self.firstView.collapse()
            
            self.secondView.collapse()
            
            self.thirdView.expand()
            
            scrollableContentViewHeightConstraint.constant = thirdView.frame.size.height + thirdView.frame.origin.y
            currentPlayerId = PlayerID.VIRAT_ID
            
            
        case PlayerID.VIRAT_ID:
            self.showOnlyFirstView()
        }
        
        self.updateCTAButtonText()
    }
    
    func showOnlyFirstView(){
        self.firstView.expand()
        self.secondView.isHidden = true
        self.thirdView.isHidden = true
        scrollableContentViewHeightConstraint.constant = firstView.frame.size.height
        currentPlayerId = PlayerID.SOURAV_ID
    }
    
    func showSecondViewExpanded(){
        //show second view Expanded with first view collapsed and third view hidden
        self.firstView.collapse()
        self.secondView.expand()
        self.thirdView.isHidden = true
        scrollableContentViewHeightConstraint.constant = secondView.frame.size.height + secondView.frame.origin.y
        currentPlayerId = PlayerID.MS_DHONI_ID
    }
    
    func updateCTAButtonText(){
        ctaButton.setTitle(players.playerInfoArray[currentPlayerId.rawValue].shortDescription, for: .normal)
    }
    
}

