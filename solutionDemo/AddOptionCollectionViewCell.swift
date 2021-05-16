//
//  AddOptionCollectionViewCell.swift
//  solutionDemo
//
//  Created by 정재근 on 2021/04/24.
//

import UIKit

class AddOptionCollectionViewCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let optionListTextField : UITextField = {
        let optionList = UITextField()
        optionList.textColor = .white
        optionList.placeholder = "항목"
        optionList.textAlignment = .center
        optionList.translatesAutoresizingMaskIntoConstraints = false
        return optionList
        
    }()
    
    func setupCell() {
        self.addSubview(optionListTextField)
        optionListTextField.backgroundColor = .lightGray
        tfsetRoundCorner()
        optionListTextField.anchor(top: safeTopAnchor, left: safeLeftAnchor, bottom: safeBottomAnchor, right: safeRightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    func tfsetRoundCorner() {
            optionListTextField.layer.cornerRadius = 12
            optionListTextField.layer.borderWidth = 0
    }
    
    
  
}

