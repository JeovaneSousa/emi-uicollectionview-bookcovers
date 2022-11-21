//
//  ViewController.swift
//  LearningTask-7.3
//
//  Created by rafael.rollo on 16/05/2022.
//

import UIKit

class LivrosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var api: LivrosAPI?
    var livros: [Livro] = [] {
        didSet{
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
        setupCollectionView()
        loadData()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func loadData(){
        guard let api = api else {return}
        livros = api.carregaLivros()
    }
    
}

//MARK: - Implements DataSource
extension LivrosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return livros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LivroViewCell", for: indexPath) as? LivroCollectionViewCell else{
            fatalError("Não foi possível recuperar uma célula de BookCollectionViewCell")
        }
        
        let livro = livros[indexPath.row]
        cell.livro = livro
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "LivroSectionHeader", for: indexPath) as? LivroSectionHeader else{
                fatalError("Não foi possível recuperar um section header do tipo especificado")
            }
            header.title = "Todos os livros"
            return header
        default:
            fatalError("Não foi possível recuperar uma view suplementar para o tipo \(kind)")
        }
        
    }
}

//MARK: - Implements Delegate
extension LivrosViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Não foi possível recuperar um layout.")
        }
        let numberOfItems: CGFloat = 2
        let margins = flowLayout.sectionInset
        let itemSpacing: CGFloat = flowLayout.minimumInteritemSpacing
        
        let utilWidth = collectionView.bounds.width
                        - (margins.left + margins.right)
                        - itemSpacing * (numberOfItems - 1)
        
        let itemWidth = utilWidth / numberOfItems
        return CGSize(width: itemWidth, height: itemWidth * 1.67)
        
    }
    
}


//MARK: - Implements Delegate
extension LivrosViewController: UICollectionViewDelegate{
    
}
