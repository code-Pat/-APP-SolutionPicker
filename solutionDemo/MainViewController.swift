import UIKit
import CoreData

let cellID =  "cell"

class MainViewController: UIViewController{
    //collectionView 선언
    let CollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        
        return cv
    }()
    // shortcuts 선언
    var shortcuts = [Shortcut]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //shortcuts를 CoreDataManager에서 불러오기
        self.shortcuts = CoreDataManager.shared.fetchShortcuts()
        //네비게이션바 버그로 일단 흰색으로 설정
        self.navigationController?.navigationBar.backgroundColor = .white
        //제목 List
        navigationItem.title = "List"
        //만약 ios 11 이상 이면 네비게이션바 제목 크게!
        if #available(ios 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        //네비게이션 바에 add버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),style: .plain, target: self,  action: #selector(goaddCollectionViewCell))
        //네비게이션 바에 편집 버튼 추가
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectList))
        //네비게이션 바 아이템에 관한 순서
        
        //화면에 뛰우는 권한 주기
        CollectionView.dataSource = self
        CollectionView.delegate = self
        //화면에 뛰우기
        view.addSubview(CollectionView)
        //컬렉션뷰 셀 연결
        CollectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        setCollectionView()
        
    
    }
    
    // Core Data code
        
    // get all items -> all titles in Shortcut model
    func getAllShortcuts() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        do {
            shortcuts = try context.fetch(Shortcut.fetchRequest())
            DispatchQueue.main.async {
                self.CollectionView.reloadData()
                // UI에서 사용할 때, let model = models[indexPath.row] 지정 후 model.name 과 같이 사용
            }
        }
        catch {
            //error
        }
    }
    
    
    // delete an item -> title from Shortcut model
    func deleteShortcut(item: Shortcut) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        //let shortcut = NSEntityDescription.insertNewObject(forEntityName: "Shortcut", into : context)
        context.delete(item)
        //CoreDataManager.managedObjectContext.deleteObject(item)
        do {
            try context.save()
            getAllShortcuts()
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    // get a new item -> new title and update to an original title
    
    func updateItem(item: Shortcut, newTitle: String, newOption: String) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        item.title = newTitle
        //item.option = newOption
        do {
            try context.save()
        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
//cell 갯수
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        // return shortcuts.count
    }
//cell 에 관한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ListCollectionViewCell
        cell.editButton.addTarget(self, action: #selector(edit), for: .touchUpInside)
        //
        //let shortcut = shortcuts[indexPath.row]
        //cell.listNameLabel.text = shortcut.title
        return cell
    }
}
extension MainViewController: UICollectionViewDelegate {
    
}
//cell의 크기와 간격 설정
extension MainViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 20, height: 110)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    @objc fileprivate func goaddCollectionViewCell() {
        print("add")
        
        let storyboard = UIStoryboard(name: "AddVC", bundle: nil)
        guard let AddListController = storyboard.instantiateViewController(identifier: "addViewController") as? AddViewController else { return }
        self.navigationController?.pushViewController(AddListController, animated: true)
 

//        let addVC = AddViewController()
//        self.navigationController?.pushViewController(addVC, animated: true)
        
    }
    @objc fileprivate func selectList() {
        print("선택")
    }
    @objc fileprivate func edit() {
        print("편집")
        let editVC = EditViewController()
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    //CollectionView 설정 함수
    func setCollectionView() {
        //뷰 배경 흰색 네비게이션바 
        view.backgroundColor = .white
        //컬렉션뷰 배경 흰색
        CollectionView.backgroundColor = .white
        CollectionView.translatesAutoresizingMaskIntoConstraints = false
        //컬렉션뷰 위치 설정
        CollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        CollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        CollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        CollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
