//
//  ListTableViewCell.swift
//  solutionDemo
//


import UIKit

class ListTableViewCell: UITableViewCell {
    
    let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "title"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        setTf()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setTf() {
        addSubview(textField)
        
    }


}
