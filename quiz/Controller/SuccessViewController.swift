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
    var questionWord = [""]
    var userInput = [""]
    @IBOutlet weak var SuccessMessage: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SuccessMessage.text = success
        var wordyq = ""
        for qword in questionWord {
            wordyq.append(qword+"\n")
        }
        questionLabel.text = wordyq
        var wordya = ""
        for aword in userInput {
            wordya.append(aword+"\n")
        }
        userLabel.text = wordya

        

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
