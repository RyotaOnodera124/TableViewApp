//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by 小野寺良太 on 2023/08/28.
//

import UIKit

class AddListViewController: UIViewController {
    
    @IBOutlet weak var addTextField: UITextField!
    var taskArray: [String] = [] //入力したリストを格納する配列
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //まずはUserDefaultsからすでに入力されているタスクをtaskArrayに読み込む
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
    }
    
    @IBAction func addTask(_ sender: Any) {
        let userDefaults = UserDefaults.standard //そのままだと長いので変数に入れる
        
            taskArray.append(addTextField.text!) //TextFieldで記入されたテキストを入れる
        
            userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存
        
            self.navigationController?.popViewController(animated: true) //1つ前の画面に戻る
        
        if addTextField.text != "" {
            
            taskArray.append(addTextField.text!)
            userDefaults.set(taskArray, forKey: "add")
            self.navigationController?.popViewController(animated: true)
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

}
