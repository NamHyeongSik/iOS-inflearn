//
//  ViewController.swift
//  TodoApp
//
//  Created by HYEONG SIK NAM on 2022/04/11.
//

import UIKit
import CoreData

enum PriorityLevel: Int64 {
    case level1
    case level2
    case level3
}

extension PriorityLevel {
    var color: UIColor {
        switch self {
        case .level1:
            return .red
        case .level2:
            return .blue
        case .level3:
            return .green
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todoData = [TodoApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makeNavigationBar()
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        self.fetchData()
        toDoTableView.reloadData()
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<TodoApp> = TodoApp.fetchRequest()
        
        let context = appdelegate.persistentContainer.viewContext
        
        do {
            self.todoData = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    func makeNavigationBar() {
        self.title = "TODO"

        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewToDo))
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item

        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .purple.withAlphaComponent(0.2)
        self.navigationController?.navigationBar.standardAppearance = barAppearance
        //after ios 15
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    @objc func addNewToDo() {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.todoData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        cell.topTitleLabel.text = todoData[indexPath.row].title
        
        if let hasDate = todoData[indexPath.row].date {
            let fomatter = DateFormatter()
            fomatter.dateFormat = "MM-dd hh-mm-ss"
            let dateString = fomatter.string(from: hasDate)
            cell.dateLabel.text = dateString
        } else {
            cell.dateLabel.text = ""
        }
        
        let priorityLevel = todoData[indexPath.row].priorityLevel
        
        let priorityColor = PriorityLevel(rawValue: priorityLevel)?.color
        
        cell.priorityView.backgroundColor = priorityColor
        cell.priorityView.layer.cornerRadius = cell.priorityView.bounds.height / 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        detailVC.selectedTodoData = todoData[indexPath.row]
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: TodoDetailViewControllerDelgate {
    func didFinishSaveData() {
        self.fetchData()
        self.toDoTableView.reloadData()
    }
}
