//
//  CommentsViewController.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 15.04.2021.
//

import UIKit

class CommentsViewController: UIViewController {
    
    //MARK: вспомогательная переменная для массива данных
    var commentsArray = [UserComments]()
    
    //MARK: вспомогательная переменная для передачи Id полученного из данных поста
    var commentId = String()
    
    //MARK: объявляем константу класса для использования индикатора загрузки
    let activityIndicator = ActivityIndicator()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        //MARK: вызываем метод получения данных и подставляем значение id
        fetchCommentsData(commentId: "\(commentId)")
    }
    
    //MARK: - метод получения данных комментариев
    func fetchCommentsData(commentId: String) {
        
        let headers = ["app-id": "607ab61911eb5c5ce6afd508"]
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://dummyapi.io/data/api/post/\(commentId)/comment/")! as URL,
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
                    
                    //MARK: Получаем общие данные и вытягиваем  message  комментарий
                    let commentsData = try JSONDecoder().decode(Comments.self, from: data)
                    
                    //MARK: получили массив всех данных файла json
                    self.commentsArray = commentsData.data
                    
                    //MARK: обновляем данные в таблице
                    self.tableView.reloadData()
                    
                    //MARK: Убираем индикатор загрузки
                    self.activityIndicator.hide()
                    
                } catch let error {
                    
                    print("Error serialization", error)
                }
            }
        }.resume()
    }
}
