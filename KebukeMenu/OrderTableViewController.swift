//
//  OrderTableViewController.swift
//  KebukeMenu
//
//  Created by star on 2020/4/15.
//  Copyright © 2020 star. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController,SSRadioButtonControllerDelegate{
    func didSelectButton(selectedButton: UIButton?) {
        if let currentButton = addRadioButtonController!.selectedButton(){
           AddInformation = currentButton.currentTitle!
        }
        if let SizeButton = SizeRadioButtonController!.selectedButton(){
        SizeInformation = SizeButton.currentTitle!
        }
        if let TempButton = TempRadioButtonController!.selectedButton(){
        TempInformation = TempButton.currentTitle!
        }
        if let SugerButton = SugerRadioButtonController!.selectedButton(){
        SugerInformation = SugerButton.currentTitle!
        }
    }
    

    
    @IBOutlet var Size: [SSRadioButton]!
    
    @IBOutlet var AddBoba: [SSRadioButton]!
    
    @IBOutlet var Temp: [SSRadioButton]!
    
    @IBOutlet var Suger: [SSRadioButton]!
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var AddOrderButton: UIButton!
    
    @IBOutlet weak var SizePriceLabel: UILabel!
    var nameInformation:String?
    var SizeInformation:String?
    var AddInformation: String?
    var TempInformation:String?
    var SugerInformation:String?
    var PriceInformaton:Int?
    var teaName:teaType!
    
    var SizeRadioButtonController: SSRadioButtonsController?
    var addRadioButtonController: SSRadioButtonsController?
    var TempRadioButtonController:SSRadioButtonsController?
    var SugerRadioButtonController:SSRadioButtonsController?
    
    func changeValue(){
        if teaName.teaName == "春梅冰茶" || teaName.teaName == "冷露歐蕾" || teaName.teaName == "熟成歐蕾" || teaName.teaName == "白玉歐蕾"{
            SizePriceLabel.text = "+10"
        }
       if teaName.teaName == "白玉歐蕾"{
            AddBoba[1].isEnabled = false
            AddBoba[1].alpha = 0.5

        }
        if teaName.teaName == "熟成檸果"{
            Size[1].isEnabled = false
            Size[1].alpha = 0.5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddOrderButton.isEnabled = true
        AddOrderButton.alpha = 1
        title = teaName.teaName
        PriceInformaton = Int(teaName.price!)
        changeValue()
        addRadioButtonController = SSRadioButtonsController(buttons: AddBoba[0],AddBoba[1])
        addRadioButtonController!.delegate = self
        addRadioButtonController!.shouldLetDeSelect = true
        
        SizeRadioButtonController = SSRadioButtonsController(buttons: Size[0],Size[1])
        SizeRadioButtonController!.delegate = self
        SizeRadioButtonController!.shouldLetDeSelect = true
        
        TempRadioButtonController = SSRadioButtonsController(buttons: Temp[0],Temp[1],Temp[2],Temp[3],Temp[4],Temp[5],Temp[6],Temp[7],Temp[8])
        TempRadioButtonController!.delegate = self
        TempRadioButtonController!.shouldLetDeSelect = true
        
        SugerRadioButtonController = SSRadioButtonsController(buttons: Suger[0],Suger[1],Suger[2],Suger[3],Suger[4])
        SugerRadioButtonController!.delegate = self
        SugerRadioButtonController!.shouldLetDeSelect = true
    }

    @IBAction func AddOrderButtonfunc(_ sender: Any) {
        if nameInformation == nil && SizeInformation == nil && AddInformation == nil && TempInformation == nil && SugerInformation == nil{
            let alertController = UIAlertController(
                    title: "錯誤",
                    message: "還有選項沒選到",
                    preferredStyle: .alert)
                    //參數 preferredStyle 傳入 .alert 將顯示中間彈出視窗
                    //利用 UIAlertAction 生成視窗上顯示的按鈕
                    let okButton = UIAlertAction(
                    title: "確定",
                    style: .default
                    )
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
        }else{
            if teaName.teaName == tea[0].teaName || teaName.teaName == tea[1].teaName || teaName.teaName == tea[2].teaName || teaName.teaName == tea[3].teaName || teaName.teaName == tea[4].teaName || teaName.teaName == tea[5].teaName || teaName.teaName == tea[6].teaName || teaName.teaName == tea[12].teaName{
            if SizeInformation! == "大Large"{
                 PriceInformaton! += 5
            }else if SizeInformation! == "中Medium"  {
                PriceInformaton! = Int(teaName.price!)!
            }else{
                PriceInformaton! = Int(teaName.price!)!
            }
            if AddInformation! == "加白玉"{
                PriceInformaton! += 10
            }else if AddInformation! == "不加白玉"{
                PriceInformaton! = Int(teaName.price!)!
            }
            else{
                PriceInformaton! = Int(teaName.price!)!
            }
            nameInformation = Name.text
            PostData()
        } else if teaName.teaName == tea[10].teaName{
            if SizeInformation! == "大Large"{
                 PriceInformaton! += 10
            }else if SizeInformation! == "中Medium"  {
                PriceInformaton! = Int(teaName.price!)!
            }else{
                PriceInformaton! = Int(teaName.price!)!
            }
            nameInformation = Name.text
            PostData()
        }else {
            if SizeInformation! == "大Large"{
                 PriceInformaton! += 10
            }else if SizeInformation! == "中Medium"  {
                PriceInformaton! = Int(teaName.price!)!
            }else{
                PriceInformaton! = Int(teaName.price!)!
            }
            if AddInformation! == "加白玉"{
                PriceInformaton! += 10
            }else if AddInformation! == "不加白玉"{
                PriceInformaton! = Int(teaName.price!)!
            }
            else{
                PriceInformaton! = Int(teaName.price!)!
            }
            nameInformation = Name.text
            PostData()
        }
        PriceInformaton! = Int(teaName.price!)!
            DispatchQueue.main.asyncAfter(deadline:DispatchTime.now()+1.5){
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "TotalTableView") as? TotalTableViewController{
                self.navigationController?.pushViewController(controller, animated: true)
        }
        }
        }
        AddOrderButton.isEnabled = false
        AddOrderButton.alpha = 0.5
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func PostData() {
        let url = URL(string: "https://sheetdb.io/api/v1/khxco4ags8259")
        var urlRequest = URLRequest(url:url!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let orderSelect: [String:String] = ["name":nameInformation!,"teaName":teaName.teaName!,"suger":SugerInformation!,"Ice":TempInformation!
            ,"size":SizeInformation!,"Boba":AddInformation!,"price":String(PriceInformaton!)]
        let postData:[String:Any] = ["data" : orderSelect]
        
        do{
            let data = try? JSONSerialization.data(withJSONObject: postData, options: [])
            let task = URLSession.shared.uploadTask(with: urlRequest, from: data!){(retData,res,err)in
                NotificationCenter.default.post(name: Notification.Name("waitMessage"), object: nil, userInfo: ["message":true])
            }
            task.resume()
        }
    }

    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}

