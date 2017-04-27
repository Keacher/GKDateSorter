//
//  ExampleViewController.swift
//  GKDateSorterExample
//
//  Created by GaoXueKai on 2017/4/26.
//  Copyright © 2017年 GaoXueKai. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    
    @IBOutlet weak var inputFormatTextField: UITextField!
    
    @IBOutlet weak var inputDataTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var generButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置统一的时间处理格式
        GKDateSorter.setDefultDateformat("yyyy-MM-dd HH:mm:ss")
        
        let dateSorter = GKDateSorter(dateString: "2017>4<14 12#12#12", dateFormat: "yyyy>MM<dd HH#mm#ss")
        
        let result = dateSorter?.getDateStringWithdateFormat("yyyy 'year' MM 'month' dd 'day'")
        
        print("\(String(describing: result))")
    }
    
    
    @IBAction func generate(_ sender: UIButton) {
        
        let current = Date()
        
        let dateSorter = GKDateSorter(date: current)
        
        let result = dateSorter?.getDateStringWithdateFormat("yyyy-MM-dd HH:mm:ss")
        
        self.showResult(result!)
    }
    @IBAction func update(_ sender: UIButton) {
        
        if self.checkStringNull(self.inputFormatTextField.text!) {
            
            self.alertNote("请输入要解析的日期格式")
        }
        else if self.checkStringNull(self.inputDataTextField.text!) {
            
            self.alertNote("请输入要解析的数据")
        }
        
        let inputFormat = self.inputFormatTextField.text!
        let inputData = self.inputDataTextField.text!
        
        let dateSorter = GKDateSorter(dateString: inputData, dateFormat: inputFormat)
        
        let result = dateSorter?.getDateStringWithdateFormat("yyyy-MM-dd HH:mm:ss")
        
        self.showResult(result!)
    }
    
    
    func showResult(_ result:String) {
        self.resultLabel.text = result
    }
    
    func checkStringNull(_ string:String) -> Bool {
        
        if string.isEmpty {
            return true
        }
        return false
    }
    
    func alertNote(_ note: String) {
        
        let noteString = note
        
        let alertController = UIAlertController(title: "提示",
                                                message: noteString,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "确定",
                                   style: .cancel) { (action) in
            
        }
        alertController.addAction(action)
        
        self.present(alertController, animated: true) {
            
        }
    }
    
}
