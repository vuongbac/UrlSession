//
//  ViewController.swift
//  Api
//
//  Created by Vương Toàn Bắc on 8/31/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let privateIdentifier = "TableViewCell"
    
    var data:[User] = []
    var refreshControl: UIRefreshControl?

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblNoData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: privateIdentifier, bundle: nil), forCellReuseIdentifier: privateIdentifier)
         tableView.register(UINib(nibName: "LoadCell", bundle: nil), forCellReuseIdentifier: "LoadCell")
        getData()
        self.tableView.reloadData()
       addRefreshControl()

    }
    
    func addRefreshControl() {
       
    }
    
    @objc func refreshList() {
       self.tableView.refreshControl?.endRefreshing()
    }
    
    
    func getData() {
        if  let url = URL(string: "http://demo0737597.mockable.io/master_data") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decorder = JSONDecoder()
                    do{
                        let parsedJSON = try decorder.decode(ListUser.self, from: data)
                        self.data = parsedJSON.data
                        print(data)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.lblNoData.isHidden = !(self.data.count == 0)
                            if self.data.count != 0 {
                                self.lblNoData.isHidden = true
                                self.addRefreshControl()
                            }else{
                                self.lblNoData.isHidden = false
                            }
                        }
                    }
                    catch {
                        print("error")
                    }
                }
                }.resume()
        }
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:privateIdentifier) as! TableViewCell
        let user = data[indexPath.row]
        cell.getData(data: user)
        return cell
    }
    
    
}

