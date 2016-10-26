//
//  SetTimeViewController.swift
//  Pinkuva
//
//  Created by Mohamed Altahan on 10/15/16.
//  Copyright © 2016 Pinkuva. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SetTimeViewController: ButtonBarPagerTabStripViewController {
    weak var dialog: PopupDialog?
    weak var containerController: SetTimeViewControllerDelegate?

    override func viewDidLoad() {
        self.setButtonBarProperties()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let fromViewController = self.storyboard!.instantiateViewControllerWithIdentifier("chooseDateTimeViewController") as! chooseDateTimeViewController
        fromViewController.containerController = self.containerController
        let toViewController = self.storyboard!.instantiateViewControllerWithIdentifier("chooseDateTimeViewController") as! chooseDateTimeViewController
        toViewController.containerController = self.containerController
        toViewController.type = .To
        
        return [fromViewController, toViewController]
    }
    
    
    func setButtonBarProperties() {
        // ALL CODE FROM GITHUB PAGE
        settings.style.selectedBarBackgroundColor = UIColor.whiteColor()
        
        // each buttonBar item is a UICollectionView cell of type ButtonBarViewCell
        settings.style.buttonBarItemBackgroundColor = UIColor.clearColor()
        if let font = UIFont(name: "GEFlow", size: 18) {
            settings.style.buttonBarItemFont = font
        }
        // helps to determine the cell width, it represent the space before and after the title label
        //        settings.style.buttonBarItemLeftRightMargin: CGFloat = 8
        settings.style.buttonBarItemTitleColor = UIColor.whiteColor()
        // in case the barView items do not fill the screen width this property stretch the cells to fill the screen
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        
        PagerTabStripBehaviour.Progressive(skipIntermediateViewControllers: true, elasticIndicatorLimit: true)
        
    }

    @IBAction func done() {
        
        self.dialog?.dismiss()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
