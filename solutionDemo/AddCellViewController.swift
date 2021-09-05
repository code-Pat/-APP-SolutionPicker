//
//  AddCellViewController.swift
//  solutionDemo
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






