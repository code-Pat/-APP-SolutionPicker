//
//  AddViewController.swift
//  solutionDemo
//


import UIKit
import CoreData

class AddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AddList"
        view.backgroundColor = .white
        uiViewRoundCorner()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveList))
        
    }
    
    @IBOutlet weak var titleUiView: UIView!
    
    @IBOutlet weak var optionsUiView: UIView!
    
 
    @IBOutlet weak var titleTf: UITextField!
    
    @IBOutlet weak var option1Tf: UITextField!
    
    @IBOutlet weak var option2Tf: UITextField!
    
    @IBOutlet weak var option3Tf: UITextField!
    
    @IBOutlet weak var option4Tf: UITextField!
    
    @IBOutlet weak var option5Tf: UITextField!
    
    @IBOutlet weak var option6Tf: UITextField!
    
    @IBOutlet weak var option7Tf: UITextField!
    
    @IBOutlet weak var option8Tf: UITextField!
    
    @IBOutlet weak var option9Tf: UITextField!
    
    @IBOutlet weak var option10Tf: UITextField!
    
    @IBOutlet weak var option11Tf: UITextField!
    
    @IBOutlet weak var option12Tf: UITextField!
    
    func setUiView(){
            titleUiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            optionsUiView.topAnchor.constraint(equalTo: titleUiView.bottomAnchor).isActive = true
    }
    
    
     // 우선 optionTextField의 값들을 임시 Array tempArray로 몰아 넣고 그 값을 AddCellVC에서 받아서 처리하는 거로.
    var tmpArray : [String] = []
    var optionArray : [String] = []

    
    func putOptionsToArray() {
        
        if !option1Tf.text!.isEmpty {tmpArray.append(option1Tf.text!)}
        else if !option2Tf.text!.isEmpty {tmpArray.append(option2Tf.text!)}
        else if !option3Tf.text!.isEmpty {tmpArray.append(option3Tf.text!)}
        else if !option4Tf.text!.isEmpty {tmpArray.append(option4Tf.text!)}
        else if !option5Tf.text!.isEmpty {tmpArray.append(option5Tf.text!)}
        else if !option6Tf.text!.isEmpty {tmpArray.append(option6Tf.text!)}
        else if !option7Tf.text!.isEmpty {tmpArray.append(option7Tf.text!)}
        else if !option8Tf.text!.isEmpty {tmpArray.append(option8Tf.text!)}
        else if !option9Tf.text!.isEmpty {tmpArray.append(option9Tf.text!)}
        else if !option10Tf.text!.isEmpty {tmpArray.append(option10Tf.text!)}
        else if !option11Tf.text!.isEmpty {tmpArray.append(option11Tf.text!)}
        else if !option12Tf.text!.isEmpty {tmpArray.append(option12Tf.text!)}
        
    }
    
    private func createShortcut() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let shortcut = NSEntityDescription.insertNewObject(forEntityName: "Shortcut", into : context)
        let optionArray = tmpArray

        shortcut.setValue(titleTf.text, forKey: "title")
        shortcut.setValue(optionArray, forKey: "option")
        
        do {
            try context.save()

        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            
        }
    }

    func uiViewRoundCorner(){
        titleUiView.layer.cornerRadius = 12.0
        optionsUiView.layer.cornerRadius = 12.0
    }
    @objc fileprivate func saveList() {
        print("save")
        
    }
    
    // 우선 optionTextField의 값들을 임시 Array tempArray로 몰아 넣고 그 값을 AddCellVC에서 받아서 처리하는 거로.
   var tmpArray : [String] = []
   var optionArray : [String] = []

   
   func putOptionsToArray() {
       
       if !option1Tf.text!.isEmpty {tmpArray.append(option1Tf.text!)}
       else if !option2Tf.text!.isEmpty {tmpArray.append(option2Tf.text!)}
       else if !option3Tf.text!.isEmpty {tmpArray.append(option3Tf.text!)}
       else if !option4Tf.text!.isEmpty {tmpArray.append(option4Tf.text!)}
       else if !option5Tf.text!.isEmpty {tmpArray.append(option5Tf.text!)}
       else if !option6Tf.text!.isEmpty {tmpArray.append(option6Tf.text!)}
       else if !option7Tf.text!.isEmpty {tmpArray.append(option7Tf.text!)}
       else if !option8Tf.text!.isEmpty {tmpArray.append(option8Tf.text!)}
       else if !option9Tf.text!.isEmpty {tmpArray.append(option9Tf.text!)}
       else if !option10Tf.text!.isEmpty {tmpArray.append(option10Tf.text!)}
       else if !option11Tf.text!.isEmpty {tmpArray.append(option11Tf.text!)}
       else if !option12Tf.text!.isEmpty {tmpArray.append(option12Tf.text!)}
       
   }
    
    private func createShortcut() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let shortcut = NSEntityDescription.insertNewObject(forEntityName: "Shortcut", into : context)
        let optionArray = tmpArray

        shortcut.setValue(titleTf.text, forKey: "title")
        shortcut.setValue(optionArray, forKey: "option")
        
        do {
            try context.save()

        }
        catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            
        }
    }

}
    
    
 
