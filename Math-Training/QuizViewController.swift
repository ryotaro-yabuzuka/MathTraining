//
//  QuizViewController.swift
//  Math-Training
//
//  Created by Ryotaro Yabuzuka on 2023/02/03.
//

import UIKit

class QuizViewController: UIViewController {
    
    let total = 10 //totalの問題数
    var correct = 0 //正解すう
    var questionIndex = 0 //問題の番号
    var ansearIndex = 0 //正解の番号
    
    @IBOutlet var leftNumberLabel: UILabel!
    @IBOutlet var centerNumberLabel: UILabel!
    @IBOutlet var rightNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestions()
        // Do any additional setup after loading the view.
    }
    
    //prepareは画面が遷移する際に実行される
    //画面遷移を制御するsegueを引数にもつ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let resultVC = segue.destination as? ResultViewController{
            resultVC.result = Double(correct) / Double(total) * 100.0
        }
    }
    
    @IBAction func tapped(sender: UIButton){
        if sender.tag - 1 == ansearIndex {
            correct += 1
        }
        questionIndex += 1
        
        if questionIndex == total {
            performSegue(withIdentifier: "QuizToResult", sender: nil) //senderは遷移seguenに渡すメソッドを入れる（今回はなし）
            print("結果へ遷移")
        } else {
            setQuestions()
            print("問題が出ます")
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

    func setQuestions() {
        let leftNum = Int(arc4random_uniform(10)) //0~10の乱数を生じさせる
        var centerNum = Int(arc4random_uniform(10))
        
        ansearIndex = Int(arc4random_uniform(4))
        
        switch ansearIndex {
        case 0:
            rightNumberLabel.text = "\(leftNum + centerNum)"
        case 1:
            rightNumberLabel.text = "\(leftNum - centerNum)"
        case 2:
            rightNumberLabel.text = "\(leftNum * centerNum)"
        default:
            if centerNum == 0 {
                centerNum = 1
            }
            rightNumberLabel.text = "\(leftNum / centerNum)"
        }
        leftNumberLabel.text = "\(leftNum)"
        centerNumberLabel.text = "\(centerNum)"
        }
    }

