//
//  CourseViewController.swift
//  quiz
//
//  Created by 陳翰揚 on 15/5/2020.
//  Copyright © 2020 陳翰揚. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {
    var selectedCourse = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func courseSelected(_ sender: UIButton) {
        selectedCourse = sender.titleLabel!.text!
        self.performSegue(withIdentifier: "courseSelected", sender: self)
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "courseSelected" {
                if let destVC = segue.destination as? DayViewController {
                    destVC.course = selectedCourse
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
