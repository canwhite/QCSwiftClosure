//
//  SecondViewController.swift
//  QCSwiftClosureTest
//
//  Created by EricZhang on 2018/6/13.
//  Copyright © 2018年 BYX. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var btn:UIButton?;
    typealias MyColsure = (_ str:String)-> Void
    var myCol:MyColsure?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 1);
        self.title = "第二页";
        
        //这个就跟oc的[UIButton new]一样，是一个构造函数
        //而UIButton.init()，就和[UIButton alloc]init 一样，类似的还有initWithFrame
        btn = UIButton();
        btn?.setTitle("返回传值", for: .normal);
        btn?.frame = CGRect.init(x: 0, y: 200, width: self.view.frame.width, height: 45);
        self.view.addSubview(btn!);
        btn?.setTitleColor(UIColor.black, for: .normal);
        btn?.backgroundColor = UIColor.green;
        btn?.addTarget(self, action:#selector(backClick), for: .touchUpInside);
        

        
        
    }
    
    func changeLabelText(closure: @escaping MyColsure){
        myCol = closure
    }
    
    
    @objc func backClick() -> Void {
        

        myCol!("666");
        
        self.navigationController?.popViewController(animated: true);
        
        
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
