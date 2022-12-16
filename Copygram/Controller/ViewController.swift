//
//  ViewController.swift
//  Copygram
//
//  Created by Felipe Medeiros on 22/09/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var hzTableView: UITableView!
    @IBOutlet weak var tabBarVW: UIView!
    @IBOutlet weak var tabBarViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var perfilCollection: UICollectionView!
    @IBOutlet weak var perfilCollectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var notificationsBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    
    private var lastContentOffset: CGFloat = 0
    var hasSeen = [false, false, false, false]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.perfilCollection.register(UINib(nibName: "PerfilCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PerfilCollectionViewCell")
        self.perfilCollection.delegate = self
        self.perfilCollection.dataSource = self
        
        self.hzTableView.register(UINib(nibName:"TimeLineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeLineTableViewCell")
        self.hzTableView.delegate = self
        self.hzTableView.dataSource = self
    }
    
    //MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hasSeen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PerfilCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "PerfilCollectionViewCell", for: indexPath) as? PerfilCollectionViewCell
        
        cell?.hasSeen = hasSeen[indexPath.row]
        cell?.setupUI()
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        }else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PerfilCollectionViewCell.self), for: indexPath) is PerfilCollectionViewCell{
            hasSeen[indexPath.row] =  true
            collectionView.reloadData()
        }
    }
    
    
    //MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TimeLineTableViewCell? = hzTableView.dequeueReusableCell(withIdentifier: "TimeLineTableViewCell", for: indexPath) as? TimeLineTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 601
    }
    
    //MARK: Scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 1{
            perfilCollectionHeightConstraint.constant = (scrollView.contentOffset.y < 40) ? 90: 0
            
            if (self.lastContentOffset > scrollView.contentOffset.y) {
                self.tabBarViewHeightConstraint.constant = 70
            } else if (self.lastContentOffset < scrollView.contentOffset.y) {
                self.tabBarViewHeightConstraint.constant = 0
            }
            self.lastContentOffset = scrollView.contentOffset.y
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

