//
//  NetworkingManager.swift
//  Things The App
//
//  Created by dan phi on 20/07/2023.
//

import Foundation
class NetworkingManager: ObservableObject {
    @Published  var users = [User]()

    func fetchData() {
        if let url = URL(string: "https://api.github.com/users") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responese, err) in
                if err == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let user = try decoder.decode([User].self, from: safeData)
                            DispatchQueue.main.async {
                                self.users = user
                            }
                        } catch {
                            print("loi ne fix di: ",err)
                        }
                    }
                }
            }
            task.resume()
            
        }
    }
}
