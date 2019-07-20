//
//  DashboardVC.swift
//  Biometrics – Face ID or Touch ID
//
//  Created by Pawan kumar on 20/07/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//


import UIKit
import Foundation


class DashboardVC: UIViewController {

    @IBOutlet weak var goBackTitle: UILabel!
    @IBOutlet weak var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackButtonAction() {
       
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
}
