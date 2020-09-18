//
//  resultViewController.swift
//  marubatuApp
//
//  Created by 渋谷柚花 on 2020/09/12.
//  Copyright © 2020 渋谷柚花. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    
    var array:Int = 0
    
    override func viewWillAppear(_ animated: Bool) {

        let ansDefaults = UserDefaults.standard
    
        
        //現在保存されている配列をanscountに格納
        if ansDefaults.object(forKey:"anscount") != nil{
            array = ansDefaults.object(forKey:"anscount") as! Int
        }
      print(array)
        resultNum.text = "\(array)問正解"
        
    }


    @IBAction func backButton(_ sender: Any) {
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
        
        
    }
    @IBOutlet var resultNum: UILabel!
    
//    全ての問題に、回答したら正解数をカウント
    
//    currentQuestionsNum = questions.count {
    
    
    
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


