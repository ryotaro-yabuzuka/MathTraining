//
//  ResultViewController.swift
//  Math-Training
//
//  Created by Ryotaro Yabuzuka on 2023/02/03.
//

import UIKit

class ResultViewController: UIViewController {

    var result = 0.0
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = "\(round(result))%" //roundを書くと、小数点第一位で繰り上げ
        if result <= 50{
            messageLabel.text = "PLEASE TRY AGAIN"
        } else if result < 80 {
            messageLabel.text = "NICE"
        } else {
            messageLabel.text = "YOU ARE GREAT!!!"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
