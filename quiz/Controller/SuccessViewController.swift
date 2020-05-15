//
//  SuccessViewController.swift
//  quiz
//
//  Created by 陳翰揚 on 15/5/2020.
//  Copyright © 2020 陳翰揚. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    
    var success = "Wow"
    @IBOutlet weak var SuccessMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SuccessMessage.text = success

        

        // Do any additional setup after loading the view.
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
