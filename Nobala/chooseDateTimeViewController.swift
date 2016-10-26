//
//  chooseDateTimeViewController.swift
//  Pinkuva
//
//  Created by Mohamed Altahan on 10/15/16.
//  Copyright © 2016 Pinkuva. All rights reserved.
//

import UIKit
import XLPagerTabStrip

protocol SetTimeViewControllerDelegate: class {
    func updateChosenTimes(date: NSDate, type: ChooseTimeViewType)
}

enum ChooseTimeViewType : Int {
    case From
    case To
}

class chooseDateTimeViewController: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var datePicker: UIDatePicker!
    weak var containerController: SetTimeViewControllerDelegate?
    var type: ChooseTimeViewType = .From
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(self.type == .From ? "From" : "To" )")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        self.containerController?.updateChosenTimes(sender.date, type: self.type)
    }

}
