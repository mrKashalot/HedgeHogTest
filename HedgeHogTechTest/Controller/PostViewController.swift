//
//  ViewController.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 14.04.2021.
//

import UIKit

class PostViewController: UIViewController, UINavigationBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: вспомогательная переменная для массива данных
    var userArray = [User]()
    
    //MARK: объявляем константу класса для использования индикатора загрузки
    let activityIndicator = ActivityIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 464
        
        fetchPostsData()
    }
    
    //MARK: - метод получения данных для постов
    func fetchPostsData() {
        
        let headers = ["app-id": "607ab61911eb5c5ce6afd508"]
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://dummyapi.io/data/api/post/")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        //MARK: добавляем индикатор загрузки
        self.view.addSubview(activityIndicator)
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard let data = data else { return }
                
                do {
                    
                    let postData = try JSONDecoder().decode(Posts.self, from: data)
                    
                    print(postData)
                    
                    //MARK: получили массив всех данных файла json
                    self.userArray = postData.data
                    
                    //MARK: обновляем данные в таблице
                    self.tableView.reloadData()
                    
                    //MARK: прячем индикатор загрузки
                    self.activityIndicator.hide()
                    
                } catch let error {
                    
                    print("Error serialization", error)
                }
            }
        }.resume()
    }
}
