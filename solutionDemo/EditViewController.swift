//
//  EditViewController.swift
//  solutionDemo
//
//  Created by 정재근 on 2021/05/03.
//

import UIKit

class EditViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    /* 이곳에서 받는 텍스트 필드는 newTitle과 newOption1...11로 연결해야함. */
    
    
    var itemInSections: Array<Array<String>> = [["1A"], ["2A", "2B" , "2C", "2D", "2E", "3F"], ["3A"]]
    
    var sections: Array<String> = ["제목", "항목", "색깔"]
    
    let tableview : UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "편집", style: .plain, target: self, action: #selector(editAction))
        setTf()
    }
    
    func setTf() {
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        view.backgroundColor = .white
        tableview.backgroundColor = .white
        //오토레이아웃
        tableview.translatesAutoresizingMaskIntoConstraints = false
        //테이블뷰 위치설정
        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    //섹션 나누는 갯수는 색션의 배열 갯수만큼
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    //섹션의 제목은 배열안의 값
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    //cell갯수 itemInsections의 배열 안의 갯수만큼
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemInSections[section].count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        
        cell.textLabel?.text = "a"
        return cell
    }
    @objc fileprivate func editAction() {
        print("EditBtAc")
    }
    
    
    //Core Data
    
    func updateShortcut(item: Shortcut, newTitle: String, newOption: [String]) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        item.title = newTitle
        item.option = newOption
        do {
            try context.save()
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

}
