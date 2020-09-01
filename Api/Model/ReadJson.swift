//
//  ReadJson.swift
//  Api
//
//  Created by Vương Toàn Bắc on 8/31/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

class LoadData {

    func listUser(completion: @escaping ([ListUser]) -> ()) {
        let api = "http://demo0737597.mockable.io/master_data"
        if let url = URL(string: api){
            URLSession.shared.dataTask(with: url) { data ,res, eror in
                if let  data  = data {
                    print(data)
                    
                    let decoder = JSONDecoder()
                    print("qqqqq")
                    if let json = try? decoder.decode([ListUser].self, from: data){
                        completion(json)
                    }
                }
                }.resume()
        }
    }

}


