//
//  CollapsedView.swift
//  credStack
//
//  Created by Rushabh Singh on 22/03/21.
//  Copyright © 2021 Rushabh Singh. All rights reserved.
//

import UIKit

class CollapsedView: UIView {
    
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var contentView : UIView!
    
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
    }
    
    func setPlayerData(player : Player) {
        //Default text is "Not Available"
        if !player.name.isEmpty {
            titleLabel.text = player.name
        }
        if !player.shortDescription.isEmpty {
            shortDescriptionLabel.text = player.shortDescription
        }
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
