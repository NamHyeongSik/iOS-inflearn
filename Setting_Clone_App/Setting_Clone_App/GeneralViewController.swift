//
//  GeneralViewController.swift
//  Setting_Clone_App
//
//  Created by HYEONG SIK NAM on 2022/03/28.
//

import UIKit

//보통 하나의 파일 안에 하나의 클래스가 일반적이라 이런방식을 잘 사용하지는 않음
//그러나 너무 종속적이라서, 그니까 여기서밖에 안쓸거 같으면 이렇게 사용하는 것도 나쁘지 않음
class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView! {
        didSet{
            rightImageView.image = UIImage.init(systemName: "chevron.right")
            rightImageView.tintColor = .lightGray
        }
    }
    
}

struct GeneralModel {
    var leftTitle = ""
}

class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model = [[GeneralModel]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        
        cell.leftLabel.text = model[indexPath.section][indexPath.row].leftTitle
        
        return cell
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "General"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        model.append([GeneralModel(leftTitle: "About")])
        
        model.append(
            [GeneralModel(leftTitle: "Keyboard"),
             GeneralModel(leftTitle: "Game Controller"),
             GeneralModel(leftTitle: "Fonts"),
             GeneralModel(leftTitle: "Language & Region"),
             GeneralModel(leftTitle: "Dictionary")])
        
        model.append([GeneralModel(leftTitle: "Reset")])


    }
}
