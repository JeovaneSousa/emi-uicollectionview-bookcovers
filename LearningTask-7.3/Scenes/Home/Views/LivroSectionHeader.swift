//
//  BookSectionHeaaderCollectionReusableView.swift
//  LearningTask-7.3
//
//  Created by jeovane.barbosa on 18/11/22.
//

import UIKit

class LivroSectionHeader: UICollectionReusableView {
    

    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    var title: String? {
        didSet{
            guard let title = title else {return}
            sectionTitleLabel.text = title
        }
    }
    
        
}
