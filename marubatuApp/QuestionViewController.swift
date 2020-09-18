//
//  QuestionViewController.swift
//  marubatuApp
//
//  Created by 渋谷柚花 on 2020/09/12.
//  Copyright © 2020 渋谷柚花. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionField.delegate = self
}
    
    

    var questions:[[String:Any]] = []
    
    
    
    @IBOutlet var questionField: UITextField!
    
    
    @IBOutlet var marubatuController: UISegmentedControl!
    
    
    @IBAction func tapSaveButon(_ sender: Any) {
        if questionField .text != ""{
//            初期値boolの　を格納するマルバツアンサー
            var marubatuAnswer:Bool = true
//            切り替えのやつは、0番1番というルール
            if marubatuController.selectedSegmentIndex == 1{
                marubatuAnswer = false
            } else {
                
                marubatuAnswer = true
                
            }
//UserDefaults.standardをUserdefaultという名前に短縮
            let userDefaults = UserDefaults.standard
//現在保存されている配列をquestionsに格納
            if userDefaults.object(forKey:"questions") != nil{
                questions = userDefaults.object(forKey:"questions") as! [[String:Any]]
                
            }
// 配列にアペンド
            questions.append(
// テキストで保存
                ["question":questionField.text!,
                 "answer":marubatuAnswer])
// 保存
            userDefaults.set(questions,forKey: "questions")
            showAlert(message: "問題が保存されました。")
//テキストフィールドの中身を空にする
            questionField.text = ""
            
            print(questions)
            
        } else {
            showAlert(message: "問題を作成してください。")
        }
                
    }
    
    
    @IBAction func tapAllDeleteButton(_ sender: Any) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey:"questions")
        
        
        userDefaults.set([],forKey: "questions")
        showAlert(message: "問題を全て削除しました。")
        
        
    }
    

    @IBAction func tapBackButton(_ sender: Any) {
//画面を一つ前に戻す
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func showAlert(message:String){
            let alert = UIAlertController(title: nil, message: message, preferredStyle:.alert)
            let close = UIAlertAction(title: "閉じる", style:.cancel, handler: nil)
            alert.addAction(close)
            
            present(alert,animated: true,completion: nil)
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
