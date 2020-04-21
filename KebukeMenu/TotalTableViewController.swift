//
//  TotalTableViewController.swift
//  KebukeMenu
//
//  Created by star on 2020/4/16.
//  Copyright © 2020 star. All rights reserved.
//

import UIKit

struct OrderResults: Encodable {
    var results: orderList
}

struct orderList: Codable {
    var name:String?
    var teaName:String?
    var suger:String?
    var Ice:String?
    var size:String?
    var Boba:String?
    var price:String?
    
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
            let teaName = json["teaName"] as? String,
            let suger = json["suger"] as? String,
            let Ice = json["Ice"] as? String,
            let size = json["size"] as? String,
            let Boba = json["Boba"] as? String,
            let price = json["price"] as? String
        
        else{
             return nil
        }
        
        self.name = name
        self.teaName = teaName
        self.suger = suger
        self.Ice = Ice
        self.size = size
        self.Boba = Boba
        self.price = price

    }
}


class TotalTableViewController: UITableViewController {
 
   var OrderLists = [orderList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 0
        let urlstr = "https://sheetdb.io/api/v1/khxco4ags8259".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlstr!)
        
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            if let data = data,let contents = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String:Any]]{
                for content in contents{
                    if let data = orderList(json:content){
                        self.OrderLists.append(data)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return OrderLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderResults", for: indexPath) as! TotalTableViewCell
        let order = OrderLists[indexPath.row]
        cell.Nmae.text = order.name
        cell.TeaName.text = order.teaName
        cell.Size.text = order.size
        cell.Suger.text = order.suger
        cell.Ice.text = order.Ice
        cell.Addition.text = order.Boba
        cell.price.text = order.price
        
    return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let order = OrderLists[indexPath.row]
        deleteDataSheetDB(orderData: order)
        OrderLists.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }
    
    func deleteDataSheetDB(orderData: orderList) {
        if let urlStr = "https://sheetdb.io/api/v1/khxco4ags8259/name/\(orderData.name!)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "DELETE"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let order = OrderResults(results: orderData)
            let jsonEncoder = JSONEncoder()
            if let data = try? jsonEncoder.encode(order) {
                let task = URLSession.shared.uploadTask(with: urlRequest, from: data) { (retData, response, error)in
                    let decoder = JSONDecoder()
                    if let retData = retData, let dic = try? decoder.decode([String: Int].self, from: retData), dic["deleted"] == 1 {
                        print("刪除成功")
                    } else {
                        print("刪除失敗")
                    }
                }
                task.resume()
            } else {
                print("刪除")
            }
        }
    }

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

}

