//
//  ViewController.swift
//  QCSwiftClosureTest
//
//  Created by EricZhang on 2018/6/13.
//  Copyright © 2018年 BYX. All rights reserved.
//

import UIKit
/*
 这个项目主要测试闭包的反向传值
 */

/*
 ?的使用
 1.声明Optional值变量
 2.用在对Optional值操作中，用来判断是否能响应后面的操作
 3.用于安全调用protocol的optional方法
 4.使用 as? 向下转型(Downcast)
 
 */

//放一个label显示回调信息



class ViewController: UIViewController {
    var label:UILabel?;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //加一个右侧按钮
        let item = UIBarButtonItem(title:"下一页",style:UIBarButtonItemStyle.plain,target:self,action:#selector(nextBtnClicked))
        self.navigationItem.rightBarButtonItem = item
        
        self.title = "首页";
        
        
        label = UILabel();
        label?.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: 45);
        label?.backgroundColor = UIColor.cyan;
        label?.textColor = UIColor.black;
        label?.textAlignment = .center;
        label?.text = "下一页回调内容的显示,请点击右侧下一页";
        self.view.addSubview(label!);
        
        


    }
    
    @objc func nextBtnClicked() -> Void {
        
        let sVC:SecondViewController = SecondViewController();
        weak var weakSelf = self;
        sVC.changeLabelText { (str) in
            
            weakSelf?.label?.text = str;
            
        }
        self.navigationController?.pushViewController(sVC, animated:true);
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

