//
//  TableViewController.swift
//  TableViewApp
//
//  Created by 小野寺良太 on 2023/08/27.
//

import UIKit

class TableViewController: UITableViewController {
    
    var taskArray: [String] = []
    
    // 画面内に表示する名前を入れています。
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        
        //"add"というキーで保存された値が何かある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
        //tableViewを更新
        tableView.reloadData()
    }

    // MARK: - Table view data source
    // セクションの数を返すメソッド
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //セクションの中の行(セル)の数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 「配列の変数名.count」で配列の要素数を取得できる
        return taskArray.count
    }
    
    //各行のセルを表示する際に呼ばれる処理です
    //この中で表示内容を設定するプログラムを記述します
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //セルのオブジェクトを作成します
        //この中で表示内容を設定するプログラムを記述します
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        
        // namesから該当する行の文字列を取得してセルに設定します
        // indexPath.rowで何行目かがわかります
        cell.textLabel?.text = taskArray[indexPath.row]
        
        
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView,  commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let userDefaults = UserDefaults.standard
        
        print(taskArray)
        if editingStyle == .delete {
            // Delete the row from the data source
            self.taskArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
        }
        
        userDefaults.set(taskArray, forKey: "add")
        
    }

}
