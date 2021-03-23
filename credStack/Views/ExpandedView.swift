//
//  ExpandedView.swift
//  credStack
//
//  Created by Rushabh Singh on 22/03/21.
//  Copyright © 2021 Rushabh Singh. All rights reserved.
//

import UIKit

class ExpandedView: UIView {
    
    var contentView : UIView!
    let utils = Utils()
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
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
        if !player.description.isEmpty {
            descriptionLabel.text = player.description
        }
        descriptionLabel.frame.size.height = utils.heightForLabel(text: descriptionLabel.text!, font: descriptionLabel.font, width: descriptionLabel.frame.size.width)
        descriptionLabel.sizeToFit()
    }
    
    func getHeightOfView() -> CGFloat {
        return titleLabel.frame.origin.y + titleLabel.frame.size.height + descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + VERTICAL_PADDING
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
}
