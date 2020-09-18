//
//  selViewController.swift
//  marubatuApp
//
//  Created by 渋谷柚花 on 2020/09/12.
//  Copyright © 2020 渋谷柚花. All rights reserved.
//

import UIKit

class selViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func makeQuestion(_ sender: Any) {
    let ThirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! QuestionViewController
    self.present(ThirdViewController, animated: true, completion: nil)
    }
    
   
        
        
    @IBAction func answerQuestion(_ sender: Any) {
       let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! ViewController
       self.present(SecondViewController, animated: true, completion: nil)
        
    }
    
//


}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

