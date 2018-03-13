//
//  ViewController.swift
//  相亲神器
//
//  Created by 王宁 on 2017/3/31.
//  Copyright © 2017年 mrwang90hou. All rights reserved.
//

import UIKit
/*
 swift中的 Protocol
 
 Swift中的协议类似于C#中的接口（Interface），但Swift中的协议更强大，协议中不仅可以定义方法，
 
 也可以定义属性；协议不仅可以作用于类，还可以在结构体和枚举中使用。

 */
    /*
 1.通过UITextFieldDelegate关闭软键盘
    步骤：
    1-(1)先继承一个Protocol（UITextFieldDelegate）
    1-(2)写一个方法（处理程序）
    1-(3)将delegate设置到当前的类ViewController
 
 
 
 
  */
  //1-(1)继承一个Protocol ，其中的UITextFieldDelegate     定义一些接口的函数
class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var heightNumber: UISlider!
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //1-(3)将Protocol(UITextFieldDelegate)与ViewController类绑定
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   //为slider增加事件
    @IBAction func heightChanged(_ sender: Any) {
        let slider = sender as! UISlider
        //取整数
        let i = Int(slider.value)
        slider.value = Float(i)
        height.text = "\(i)厘米"
    }
    
    @IBAction func okTapped(_ sender: Any) {
        let genderText = gender.selectedSegmentIndex == 0 ? "高富帅" : "白富美"
        
        //获取西方日历
        let gregorian = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        let now  = NSDate()
        //NSYearCalendarUnit   NSMonthCalendarUnit   NSDayCalendarUnit   或||运算
      
        let components = gregorian?.components(NSCalendar.Unit.NSYearCalendarUnit, from: birthday.date, to: now as Date, options: NSCalendar.Options.init(rawValue: 0))
        
        let age = components?.year
        
        let hasPropertyText = hasProperty.isOn
        result.text = "\(String(describing: name.text)),\(String(describing: age))岁,\(genderText),身高\(String(describing: height.text)),\(hasPropertyText),求交往！"
        
    }
    //UITextFiledDelegate  中方法，“点击‘下一项’（右下角）结束🔚”
    //1-(2)重写Protocol（UITextFieldDelegate）  中的 textFieldShouldReturn方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //键盘消失
        textField.resignFirstResponder()
        return true
    }
    
}

