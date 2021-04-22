//
//  ViewController.swift
//  HedgeHogTechTest
//
//  Created by Владислав on 14.04.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK:- Расширения для использования tableView

extension PostViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomHomeCell
        
        cell.postImage.image = UIImage(named: "exampleImage")
        cell.textView.text = "Пример текста для фото"
        
        return cell
    }
}

extension PostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 481
    }
}

