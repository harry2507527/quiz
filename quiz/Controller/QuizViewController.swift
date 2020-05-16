//
//  ViewController.swift
//  quiz
//
//  Created by 陳翰揚 on 15/5/2020.
//  Copyright © 2020 陳翰揚. All rights reserved.
//

import UIKit
import Firebase
var questionWord = [" "]
var userInput = [""]
var questionNum = 0
var score = 0


class QuizViewController: UIViewController, UITextFieldDelegate {

    var path = ""
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        userInput = []
        super.viewDidLoad()
        self.answerField.delegate = self
        getQuestion()
        updateQ()
        
        
    }

    @IBAction func answerSubmitted(_ sender: Any) {
        nextQuestion()
    }
    func nextQuestion() {
        if answerField.text != "" {
            
        
        userInput.append(answerField.text!)
        if answerField.text?.lowercased() == questionWord[questionNum].lowercased() {
            score = score + 1
        }
        if questionNum < questionWord.count - 1{
            questionNum = questionNum + 1
            updateQ()
        } else{
            self.performSegue(withIdentifier: "success", sender: self)
        }
        } else {
            answerField.placeholder = "Please enter some text"
        }
    }

    @IBAction func reStartQ(_ sender: Any) {
        questionNum = 0
        score = 0
        userInput = []
        updateQ()
        
    }
    
    func fetchImage(img: String) {
        let storageRef = Storage.storage().reference(withPath: "EF2/Day 2/\(img).jpg")
        storageRef.getData(maxSize: 4*1024*1024) { [weak self] (data, error) in
            if error != nil {
                print("Got an error fetching data")
                return
            }
            if let data = data {
                self!.image.image = UIImage(data: data)
            }
        }
    }

    func updateQ() {
        if questionWord[questionNum] != nil{
            
        
        let currentword = questionWord[questionNum]
        let str = String(repeating: "*", count: currentword.count)
        Label.text = str
        
        
        answerField.text = ""
        fetchImage(img: currentword)
        }
    }
    
    func getQuestion() {
        print(path)
        let collection = Firestore.firestore().document(path)
        
        
        collection.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                if data != nil {
                    questionWord = data!["questionList"] as? [String] ?? [""]
                    self.updateQ()
                    print(questionWord)
                }
                
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == answerField {
//            textField.resignFirstResponder()
            nextQuestion()
            return false
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "success" {
            if let destVC = segue.destination as? SuccessViewController {
                destVC.success = "Great ! You got \(score) out of \(questionWord.count) right."
                destVC.userInput = userInput
                destVC.questionWord = questionWord

            }
        }
    }
    

    
}

