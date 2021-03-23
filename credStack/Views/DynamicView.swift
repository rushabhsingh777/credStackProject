//
//  DynamicView.swift
//  credStack
//
//  Created by Rushabh Singh on 22/03/21.
//  Copyright © 2021 Rushabh Singh. All rights reserved.
//

import UIKit

class DynamicView: UIView {
    var contentView : UIView!
    var playerId : PlayerID = PlayerID.SOURAV_ID
    let players = PlayerInfo()
    weak var collapsedViewDelegate: CollapsedViewProtocol?
    @IBOutlet weak var collapsedView: CollapsedView!
    @IBOutlet weak var expandedView: ExpandedView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        addSubview(contentView)
        self.isHidden = true
        self.addGestureToCollapsedView()
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func addGestureToCollapsedView() {
        let collapsedViewTap = UITapGestureRecognizer(target: self, action: #selector(self.collapsedViewClicked(_:)))
        collapsedView.isUserInteractionEnabled = true
        collapsedView.addGestureRecognizer(collapsedViewTap)
    }
    
    func setPlayerDataFor(playerId : PlayerID) {
        self.playerId = playerId
        let player : Player = players.playerInfoArray[playerId.rawValue]
        expandedView.setPlayerData(player: player)
        collapsedView.setPlayerData(player: player)
    }
    
    func getHeightOfExpandedView() -> CGFloat {
        return expandedView.getHeightOfView() + VERTICAL_PADDING
    }
    
    @objc func collapsedViewClicked(_ sender: UITapGestureRecognizer? = nil) {
        collapsedViewDelegate?.collapsedViewClicked(currentId: self.playerId)
    }
    
    func collapse(){
        self.isHidden = false
        self.collapsedView.isHidden = false
        self.expandedView.isHidden = true
    }
    
    func expand(){
        self.isHidden = false
        self.collapsedView.isHidden = true
        self.expandedView.isHidden = false
    }
    
}
