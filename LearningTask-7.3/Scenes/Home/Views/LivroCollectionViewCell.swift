//
//  bookCollectionViewCell.swift
//  LearningTask-7.3
//
//  Created by jeovane.barbosa on 18/11/22.
//

import Foundation
import UIKit
class LivroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    var livro: Livro? {
        didSet{
            guard let livro = livro else {return}
            bookImageView.image = UIImage(named: livro.titulo)
            bookTitleLabel.text = livro.titulo
        }
    }
}
