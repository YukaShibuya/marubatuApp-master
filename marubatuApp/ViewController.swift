//
//  ViewController.swift
//  marubatuApp
//
//  Created by 渋谷柚花 on 2020/09/12.
//  Copyright © 2020 渋谷柚花. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //アプリを開いて段階で、questionNumを出す
        showQuestion()
    }

    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
               
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        questions = []
        
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey:"questions") != nil{
            questions = userDefaults.object(forKey: "questions") as! [[String:Any]]
        }
        showQuestion()
    }
//    前の配列からquestionsの中に格納
    
    
    
    @IBOutlet var questionLabel: UILabel!
    //questionの番号として使う。
    var currentQuestionsNum = 0
    
    var questions : [[String:Any]] = []
    
//    let questions:[[String:Any]] = [
//        [
//            "question":"盛岡の人口は30万人である。",
//            "answer":true
//        ],
//        [
//        "question":"札幌の人口は100万人である。",
//        "answer":false
//        ],
//        [
//            "question":"函館の人口は50万人である。",
//            "answer":false
//
//        ]
//    ]
//
//    問題を表示するところ
    func showQuestion(){
//        エラーの回避
        if (questions.count > currentQuestionsNum){
            
            //定数questionの中身は、questionsのcurrentQuestionsNum番目
            let question = questions[currentQuestionsNum]
            //questionが、stringだったら、テキストラベルに、queを入れる。
            if let que = question["question"] as? String{
//            問題文の表示
                questionLabel.text = que
//            ボタンを使える(押せる)ようにしている
                falseButton.isEnabled = true
                trueButton.isEnabled = true
            }
        }else {
//            問題文が表示されない時
            questionLabel.text = "問題文を作ってください。"
            falseButton.isEnabled = false
            trueButton.isEnabled = false
        
        }
        
   
        
        
        
        
    }
//    正解した数を数える変数
    var anscounts = 0
    
//ボタンを押したときの回答のチェック
    func checkAnswer(userAnswer:Bool){
            
        let question = questions[currentQuestionsNum]
        if let ans = question["answer"] as? Bool{
            
            if userAnswer == ans{
                currentQuestionsNum += 1
                anscounts += 1
                
              showAlert(message: "正解")
            }else{
                currentQuestionsNum += 1
               showAlert(message: "不正解")
                
                }
        
        } else {
            print("答えがありません。")
            return
        }
        
        
//        let ansDefaults = UserDefaults.standard
//        //現在保存されている配列をquestionsに格納
//                    if ansDefaults.object(forKey:"anscount") != nil{
//                        anscounts = ansDefaults.object(forKey:"anscount") as! Int
//                        }
        

        
        

      
        
        
//問題の表示
//正解だったら、次の問題が表示される
//不正解だったら、そのまま同じ問題が表示される。
       showQuestion()
    }
// Alertを出す
    func showAlert(message:String){
        
       let alert = UIAlertController(title: nil, message: message, preferredStyle:.alert)
       var close = UIAlertAction(title: "閉じる", style:.cancel, handler: nil)
                     
        
        if currentQuestionsNum >= questions.count{
            
         close = UIAlertAction(title: "閉じる", style:.cancel, handler:{(action: UIAlertAction!) in
//                保存
        //        anscountというキーのユーザーデフォルトに、anscountつまり正解数を入れる
            UserDefaults.standard.set(self.anscounts ,forKey: "anscount")
               
       
                       let storyboard: UIStoryboard = self.storyboard!
                       let nextView = storyboard.instantiateViewController(withIdentifier:"resultView") as! resultViewController
                       self.present(nextView, animated: true, completion: nil)
                         
                          
            })
    }
        alert.addAction(close)
        present(alert,animated: true,completion: nil)
        
        
    }
       
    
    
       
               
        
//        let ansDefaults = UserDefaults.standard
//        //現在保存されている配列をquestionsに格納
//        if ansDefaults.object(forKey:"anscount") != nil{
//            anscounts = ansDefaults.object(forKey:"anscount") as! Int
//
//        }
//        UserDefaults.standard.set(Int(), forKey: "anscount")

        
    

    
    
    @IBOutlet var falseButton: UIButton!
    
    
    @IBOutlet var trueButton: UIButton!
    
    
    
    @IBAction func falseButton(_ sender: Any) {
    checkAnswer(userAnswer: false)
    }
    
    @IBAction func trueButton(_ sender: Any) {
        checkAnswer(userAnswer: true)
    }
    

}

