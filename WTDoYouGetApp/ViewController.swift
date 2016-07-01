//
//  ViewController.swift
//  WTDoYouGetApp
//
//  Created by miyamo on 2016/07/01.
//  Copyright © 2016年 Zombiyamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    var topLabel :UILabel!
    var answerLabel :UILabel!
    var bearDatePicker :UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bearDatePicker = UIDatePicker(frame: CGRectMake(0,self.view.bounds.height/3,self.view.bounds.width,200))
        
        //DatePickerの設定
        bearDatePicker.timeZone = NSTimeZone.localTimeZone()
        bearDatePicker.backgroundColor = UIColor.clearColor()
        bearDatePicker.minimumDate = NSDate()
        //値が変わった時のイベントを登録
        bearDatePicker.addTarget(self, action: #selector(ViewController.onDidChangeDate(_:)), forControlEvents: .ValueChanged)
        
        topLabel = UILabel(frame: CGRectMake(0,self.view.bounds.height/4,400,50))
        topLabel.text = "いつ起きるん？"
        topLabel.font = UIFont.boldSystemFontOfSize(20)
        topLabel.textColor = UIColor.brownColor()
        topLabel.textAlignment = NSTextAlignment.Center
        
        answerLabel = UILabel(frame: CGRectMake(0,self.view.bounds.height-300,400,200))
        answerLabel.numberOfLines = 2
        answerLabel.text = "はやく寝るクマ"
        answerLabel.font = UIFont.boldSystemFontOfSize(20)
        answerLabel.textColor = UIColor.brownColor()
        answerLabel.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(bearDatePicker)
        self.view.addSubview(topLabel)
        self.view.addSubview(answerLabel)
    
    }
    
    internal func onDidChangeDate(sender: UIDatePicker){
        //現在時刻より前を選択不可に
        bearDatePicker.minimumDate = NSDate()
        
        var hour :String = ""
        var minute :String = ""
        //現在時刻と起きる時刻の差を取得(秒)
        let data1 = sender.date.timeIntervalSinceDate(NSDate())
        //時差
        let hourSpan = Int(data1/60/60)
        //分差
        var minSpan = Int(data1/60)
        
        //分差から時差分を引く
        if minSpan>59 {
            minSpan -= hourSpan*60
        }
        
        if hourSpan > 0 {
            hour = "\(hourSpan)時間"
        }
        if minSpan > 0 {
            minute = "\(minSpan)分"
        }        
        if hourSpan > 0 || minSpan > 0 {
            if hourSpan >= 24 {
                answerLabel.text = "お前が起きるのは" + hour + minute + "後だクマ" + "\n" + "寝過ぎは健康に悪いクマ"
            }else{
                answerLabel.text = "お前が起きるのは" + hour + minute + "後だクマ"
            }
        }else{
            answerLabel.text = "そんなことしてないで早く寝ろクマ"
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

