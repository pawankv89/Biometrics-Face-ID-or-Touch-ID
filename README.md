# Biometrics-Face-ID-or-Touch-ID

## Biometrics – Face ID or Touch ID for Authorization User in Swift 5.

Added Some screens here.

![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_1.PNG)
![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_2.PNG)
![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_3.PNG)
![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_4.PNG)
![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_5.PNG)
![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_6.PNG)
![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_7.PNG)
![](https://github.com/pawankv89/Biometrics-Face-ID-or-Touch-ID/blob/master/images/screen_8.PNG)

## Usage

``` swift 

import UIKit
import Foundation
import LocalAuthentication

enum BiometricType {
case none
case touchID
case faceID
}

class BiometricIDAuth {

var loginReason = "Logging in with Touch ID"

let context = LAContext()

func canEvaluatePolicy() -> Bool {
return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
}

func biometricType() -> BiometricType {
let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
switch context.biometryType {
case .none:
return .none
case .touchID:
return .touchID
case .faceID:
return .faceID
}
}

func authenticateUser(completion: @escaping () -> Void) { // 1
// 2
guard canEvaluatePolicy() else {
return
}

// 3
context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
localizedReason: loginReason) { (success, evaluateError) in
// 4
if success {
DispatchQueue.main.async {
// User authenticated successfully, take appropriate action
completion()
}
} else {
// TODO: deal with LAError cases
}
}
}


}

```



``` swift 


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




```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
