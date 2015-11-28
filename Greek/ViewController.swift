//
//  ViewController.swift
//  Greek
//
//  Created by Julian Engel on 11/19/15.
//  Copyright © 2015 Julo's Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var correctedLabel: UILabel!
    @IBOutlet weak var toBeFound: UILabel!
    @IBOutlet weak var inputfield : UITextField!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var wrongLabel : UILabel!
    var indexedWord = -1
    var score = 0{
    didSet{
        scoreLabel.text = "\(score)"
    
    }
    }
    
    var wrongCount = 0{
        didSet{
            wrongLabel.text = "\(wrongCount)"
            
        }
    }
    

    
    let countries = ["Δανία","Αγγλία","Εσθονία","Φινλανδία","Ισλανδία","Ιρλανδία","Λετονία","Λιθουανία","Νορβηγία","Σκωτία","Σουηδία","Αυστρία","Βέλγιο","Γαλλία","Γερμανία","Ολλανδία"]
    let nationality = ["δανικός","αγγλικός","εσθονικός","φινλανδικός","ισλανδικός","ιρλανδικός","λετονικός","λιθουανικός","νορβηγικός","σκωτσέζικος","σουηδικός","αυστριακός","βέλγικος","γαλλικός","γερμανικός","ολλανδός"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        correctedLabel.hidden = true
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func checkWord(index : Int){
        
        toBeFound.text = "\(countries[(index + 1)])"
        let word = inputfield.text!.lowercaseString ?? "Error"
        
        if word == nationality[index]{
            
            print("Correct")
            score++
            inputfield.text = ""
            
        }
        else{
            wrongCount++
            correctedLabel.text = "THE WORD IS WRONG. CORRECT ANSWER: \(nationality[index]) FOR \(countries[index])"
            correctedLabel.hidden = false
            inputfield.text = ""
        }
        
       
        
    }
    
    @IBAction func nextGuess(sender: UIButton){
        
        
        
        if indexedWord < ((countries.count - 2)){
            correctedLabel.hidden = true
            
            indexedWord++
            print("The indexed word is \(indexedWord)")
            
            checkWord(indexedWord)
        }
        
        else
        {
            correctedLabel.hidden = false
            correctedLabel.text = "You have dound all words with a score of \(score) and got \(wrongCount) words wrong"
        }
        
    }
    
    @IBAction func returnFirstResponder(){
        
        self.resignFirstResponder()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

