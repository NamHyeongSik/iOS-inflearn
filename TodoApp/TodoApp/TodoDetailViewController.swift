//
//  TodoDetailViewController.swift
//  TodoApp
//
//  Created by HYEONG SIK NAM on 2022/04/11.
//

import UIKit
import CoreData

protocol TodoDetailViewControllerDelgate: AnyObject {
    func didFinishSaveData()
}

class TodoDetailViewController: UIViewController {

    weak var delegate:  TodoDetailViewControllerDelgate?
    
    var priority: PriorityLevel?
    
    var selectedTodoData: TodoApp?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let hasData = selectedTodoData {
            titleTextField.text = hasData.title
            priority = PriorityLevel(rawValue: hasData.priorityLevel)
            
            priorityButtonDesign()
            
            saveButton.setTitle("Update", for: .normal)
            deleteButton.isHidden = false
        } else {
            saveButton.setTitle("Save", for: .normal)
            deleteButton.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = normalButton.bounds.height / 2
        highButton.layer.cornerRadius = highButton.bounds.height / 2
    }
     
    @IBAction func setPriority(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            priority = .level1
        case 2:
            priority = .level2
        case 3:
            priority = .level3
        default:
            break
        }
        priorityButtonDesign()
    }
    
    func priorityButtonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear

        switch self.priority {
        case .level1:
            lowButton.backgroundColor = priority?.color
        case .level2:
            normalButton.backgroundColor = priority?.color
        case .level3:
            highButton.backgroundColor = priority?.color
        default:
            break
        }
    }
    
    @IBAction func saveTodo(_ sender: Any) {
        
        if selectedTodoData != nil {
            updateTodo()
        } else {
            saveTodo()
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
    
    func saveTodo() {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoApp", in: context) else { return }
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoApp else { return }
        
        object.title = titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        object.priorityLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func updateTodo() {
        guard let hasData = selectedTodoData else { return }
        guard let hasUUID = hasData.uuid else { return }
        
        let fetchRequest: NSFetchRequest<TodoApp> = TodoApp.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        do {
            let loadedData = try context.fetch(fetchRequest)
            
            loadedData.first?.title = titleTextField.text
            loadedData.first?.date = Date()
            loadedData.first?.priorityLevel = self.priority?.rawValue ?? PriorityLevel.level1.rawValue
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } catch {
            print(error )
        }
        
        
    }

    @IBAction func deleteTodo(_ sender: Any) {
        guard let hasData = selectedTodoData else { return }
        guard let hasUUID = hasData.uuid else { return }
        
        let fetchRequest: NSFetchRequest<TodoApp> = TodoApp.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        do {
            let loadedData = try context.fetch(fetchRequest)
            if let loadFirst = loadedData.first {
                context.delete(loadFirst)
                //항상 무언가를 지우거나 변경하면 save를 해주어야함
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        } catch {
            print(error)
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
}
