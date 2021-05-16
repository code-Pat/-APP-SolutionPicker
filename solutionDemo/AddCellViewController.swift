//
//  AddCellViewController.swift
//  solutionDemo
//
//  Created by 정재근 on 2021/04/23.
//

import UIKit
import CoreData


struct  SettingOption {
    let title: String
    let option: [String]
    let color: Int
}
class AddCellViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    //배열로 cell갯수 정의
    var itemsInSections: Array<Array<String>> = [["1A"], ["2A", "2B" , "2C", "2D", "2E", "3F"], ["3A"]]
    //섹션 갯수 정의 타이틀이랑
    var sections: Array<String> = ["제목", "항목", "색깔"]
    
    let tableview : UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
   
    let titleTextField : UITextField = {
            let titleName = UITextField()
            titleName.textColor = .white
            titleName.placeholder = "제목"
            titleName.textAlignment = .center
            titleName.translatesAutoresizingMaskIntoConstraints = false
            return titleName
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AddList"
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(save))
                //화면에 표시
                view.addSubview(tableview)
                //setUp TableView
                setTableView()
                tableview.delegate = self
                tableview.dataSource = self
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
        return self.itemsInSections[section].count
        }
    //cell안의 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //텍스트 필드 소환
        let textField: UITextField = {
            let text = UITextField()
            text.placeholder = "title"
            text.translatesAutoresizingMaskIntoConstraints = false
            //textField 배경 설정
            text.backgroundColor = .lightGray
            return text
        }()
        //화면에 뛰우기
        cell.addSubview(textField)
        //텍스트필드 위치설정
        textField.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: cell.leftAnchor,constant: 20).isActive = true
        textField.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: cell.rightAnchor,constant: -20).isActive = true
        //Cell 배경 설정
        cell.backgroundColor = .lightGray
        return cell
        //tableview 안에 있는 텍스트 필드의 값들 관리
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func setTableView() {
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
    //저장 버튼을 눌렀을때
    @objc fileprivate func save() {
        print("save")
        //putOptionsToArray()
        //createShortcut()
    }
    /*
     // options textfield에서 받은 인풋을 임의 배열 tmpArray에 우선적으로 집어넣음.
    func putOptionsToArray() {
        var tmpArray : [String] = []
        if !optionTextField1.isEmpty {tmpArray.append(optionTextField1)}
        else if !optionTextField2.isEmpty {tmpArray.append(optionTextField2)}
        else if !optionTextField3.isEmpty {tmpArray.append(optionTextField3)}
        else if !optionTextField4.isEmpty {tmpArray.append(optionTextField4)}
        else if !optionTextField5.isEmpty {tmpArray.append(optionTextField5)}
        else if !optionTextField6.isEmpty {tmpArray.append(optionTextField6)}
        else if !optionTextField7.isEmpty {tmpArray.append(optionTextField7)}
        else if !optionTextField8.isEmpty {tmpArray.append(optionTextField8)}
        else if !optionTextField9.isEmpty {tmpArray.append(optionTextField9)}
        else if !optionTextField10.isEmpty {tmpArray.append(optionTextField10)}
        else if !optionTextField11.isEmpty {tmpArray.append(optionTextField11)}
        else if !optionTextField12.isEmpty {tmpArray.append(optionTextField12)}
    }
     // 다른 방법, tmpArray를 optional롤 지정 후
        tmpArray = [optionTextField1, optionTextField2, ... , optionTextField12].map {$0.text!}
    */
    
    func createShortcut() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let shortcut = NSEntityDescription.insertNewObject(forEntityName: "Shortcut", into : context)

        //var optionArray : [String] = tmpArray

       // var options : [String] = []

        shortcut.setValue(titleTextField.text, forKey: "title")
        //임의 배열 tmpArray를 core data에 연결되는 optionArray에 넣고 key: option으로 지정
        //shortcut.setValue(optionArray, forKey: "option")
        
        do {
            try context.save()

        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            
        }
    }
}






