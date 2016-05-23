//
//  ViewController.swift
//  calculator
//
//  Created by student26 on 15/6/18.
//  Copyright (c) 2015年 wyd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ResultLable: UITextField!
    
    var num1:Double=0.0
    var num2:Double=0.0
    var result:Double=0.0
    var initial:Bool=false//判断初始状态
    var Type:Bool=false//判断类型
    var dot:Bool=false//判断点
    var Operator:String=""
     //获取运算符
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    internal func CalIn(s:String)//输入
    {
        if(initial==false)
        {
        ResultLable.text=s
        initial=true
        }
        else
        {
            ResultLable.text=ResultLable.text+s
        }
    }
    internal func ChangeType()//转型
    {
        if(Type==false){
        num1=(ResultLable.text as NSString).doubleValue
            Type=true
        }
        else
        {
            num2=(ResultLable.text as NSString).doubleValue
            
        }
    }
    internal func Getoperator(oper:String)
    {
        Operator=oper
        initial=false
        ChangeType()
        dot=false
    }
    internal func Intdouble(id:Double)
    {
        
        if(id%1==0)
        {
            ResultLable.text="\((Int)(id))"
        }
        else
        {
            ResultLable.text="\(id)"
        }

    }
    @IBAction func Clicked(sender: UIButton) {
        var value=sender.currentTitle
        switch(value!)
        {
            case "1":
            CalIn("1")
            case "2":
            CalIn("2")
            case "3":
            CalIn("3")
            case "4":
            CalIn("4")
            case "5":
            CalIn("5")
            case "6":
            CalIn("6")
            case "7":
            CalIn("7")
            case "8":
            CalIn("8")
            case "9":
            CalIn("9")
            case "0":
            if(initial==false)
            {
                ResultLable.text="0"
            }
            else
            {
                ResultLable.text=ResultLable.text+"0"
            }
            
            case "+/-":
                var temp1:Double=(ResultLable.text as NSString).doubleValue
                if(temp1>0)
                {
                    ResultLable.text="-"+ResultLable.text
                }
                else
                {
                    temp1=abs(temp1)
                    //ResultLable.text="\(temp1)"
                    /*var temp2:Int=(Int)(temp1)
                    var temp3:Double=(Double)(temp2)
                    if(temp3==temp1)
                    {
                    ResultLable.text="\(temp2)"
                    }
                    else
                    {
                        ResultLable.text="\(temp1)"
                    }*/
                    /*if(temp1%1==0)
                    {
                        ResultLable.text="\((Int)(temp1))"
                    }
                    else
                    {
                        ResultLable.text="\(temp1)"
                    }*/
                    Intdouble(temp1)
            }
            case ".":
            if(initial==false)
            {
                ResultLable.text="0."
                initial=true
                dot=true
            }
            else if(dot==false)
            {
                ResultLable.text=ResultLable.text+"."
                dot=true
            }
            case "C":
                result=0.0
                num1=0.0
                num2=0.0
                initial=false
                dot=false
                Type=false
                ResultLable.text="0."
            case "➕":
            Getoperator("add")
            case "➖":
            Getoperator("sub")
            case "✖️":
            Getoperator("mul")
            case "➗":
            Getoperator("div")
            case "=":
                if(initial==true)
                {
                    num2=0
                }
            ChangeType()
            if(Operator=="add")
            {
                result=num1+num2
            }
            else if(Operator=="sub")
            {
                result=num1-num2
            }
            else if(Operator=="mul")
            {
                result=num1*num2
            }
            else if(Operator=="div")
            {
                if(num2==0)
                {
                    return
                }
                else
                {
                result=num1/num2
                }
            }
            else
            {
                result=num1
            }
            initial=false
            Type=false
            //ResultLable.text="\(result)"
                /*var result1:Int=(Int)(result)
                var result2:Double=(Double)(result1)
                if(result2==result)
                {
                    ResultLable.text="\(result1)"
                }else
                {
                    ResultLable.text="\(result)"
            }
           */
            /*if(result%1==0)
            {
                ResultLable.text="\((Int)(result))"
            }
            else
            {
                ResultLable.text="\(result)"
            }*/
            Intdouble(result)
            case "%":
                var temp2:Double=(ResultLable.text as NSString).doubleValue
                temp2=temp2/100
               Intdouble(temp2)
            //ResultLable.text="\(temp2)"
            case "1/x":
                var temp3:Double=(ResultLable.text as NSString).doubleValue
                if(temp3==0)
                {
                    ResultLable.text="除数不能为0"
                }
                else
                {
                temp3=1/temp3
                //ResultLable.text="\(temp3)"
                    Intdouble(temp3)
                }
            case "x2":
            var temp4:Double=(ResultLable.text as NSString).doubleValue
            temp4=temp4*temp4
            //ResultLable.text="\(temp4)"
            Intdouble(temp4)
            case "sqrt":
                var temp5:Double=(ResultLable.text as NSString).doubleValue
                if(temp5<0)
                {
                    ResultLable.text="函数输入无效！"
                }
                else
                {
                temp5=sqrt(temp5)
                //ResultLable.text="\(temp5)"
                    Intdouble(temp5)
                }
            case "delete":
                var temp6:String=""
                
                temp6=ResultLable.text
                if(temp6=="")
                {
                    
                    result=0.0
                    num1=0.0
                    num2=0.0
                    initial=false
                    dot=false
                    Type=false
                    ResultLable.text="0."
                    return
                }
                else
                {
                var str1=advance(temp6.endIndex,-1)
                var str2:String=temp6.substringToIndex(str1)
                ResultLable.text=str2
                }
            
            default:
            return
            
            
        }

}
}
