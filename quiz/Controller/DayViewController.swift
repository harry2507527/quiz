//
//  DayViewController.swift
//  quiz
//
//  Created by 陳翰揚 on 15/5/2020.
//  Copyright © 2020 陳翰揚. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {
    var selectedTitle = ""
    var path = ""
    var course = ""

    @IBOutlet var dayButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func daySelected(_ sender: UIButton) {
        selectedTitle = sender.titleLabel!.text!
        print(selectedTitle)
        path = "Books/\(course)/Days/\(selectedTitle)"
        print(path)
        self.performSegue(withIdentifier: "daySelected", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "daySelected" {
            if let destVC = segue.destination as? QuizViewController {
                destVC.path = path

            }
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
