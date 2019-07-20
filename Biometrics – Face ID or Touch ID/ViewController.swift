//
//  ViewController.swift
//  Biometrics – Face ID or Touch ID
//
//  Created by Pawan kumar on 20/07/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pinTextFiield: UITextField!
    
    @IBOutlet weak var touchIDTitle: UILabel!
    @IBOutlet weak var touchIDImage: UIImageView!
    @IBOutlet weak var touchIDButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pinTextFiield.delegate = self
        
        let touchMe = BiometricIDAuth()
        
        switch touchMe.biometricType() {
        case .faceID:
           
            touchIDTitle.text = "Login with Face ID"
            touchIDImage.image = UIImage(named: "face_id")
            
        case .touchID:
            
            touchIDTitle.text = "Login with Touch ID"
            touchIDImage.image = UIImage(named: "touch_id")
            
        default:
            
            touchIDTitle.text = "UKnown"
            touchIDImage.image = nil
        }
        
        //Must Call because Showing Auth Alert When Load View First Time
        touchIDLoginAction()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pinTextFiield.resignFirstResponder()
       return true
    }
    
    @IBAction func touchIDLoginAction() {
        
        let touchMe = BiometricIDAuth()
        touchMe.authenticateUser() { [weak self] in
            
            //Go To Dashboard Screen When Login Success Fully
           let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
           let dashobardVC = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            self?.navigationController?.pushViewController(dashobardVC, animated: true)
    
        }
    }
}


