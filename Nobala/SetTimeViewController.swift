//
//  SetTimeViewController.swift
//  Pinkuva
//
//  Created by Mohamed Altahan on 10/15/16.
//  Copyright © 2016 Pinkuva. All rights reserved.
//

import UIKit

protocol SetTimeViewControllerDelegate: class {
    func updateChosenTimes(date: NSDate, type: ChooseTimeViewType)
    func refreshPresentedData()
}

enum ChooseTimeViewType : Int {
    case From
    case To
}

class SetTimeViewController: UIViewController {
    weak var dialog: PopupDialog?
    weak var containerController: SetTimeViewControllerDelegate?
    var type: ChooseTimeViewType = .From

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        self.containerController?.updateChosenTimes(sender.date, type: self.type)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done() {
        self.containerController?.refreshPresentedData()
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
