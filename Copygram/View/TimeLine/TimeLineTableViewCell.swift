//
//  TimeLineTableViewCell.swift
//  Copygram
//
//  Created by Felipe Medeiros on 23/09/22.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var borderVw: UIView!
    @IBOutlet weak var perfilIcon: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet var imageVIew: UIImageView!
    @IBOutlet var like: UIButton!
    @IBOutlet weak var comment: UIButton!
    @IBOutlet var save: UIButton!
    
    var isChecked:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        perfilIcon.layer.cornerRadius = perfilIcon.frame.height/2
        usernameLabel.text = "@seacella__"
        imageVIew.isUserInteractionEnabled = true
        like.tintColor = .black
        self.borderVw.layer.cornerRadius = self.borderVw.frame.height/2
        self.borderVw.clipsToBounds = true
        
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.borderVw.frame.size)
        gradient.colors =  [UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.systemPink.cgColor, UIColor.purple.cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 6
        
        shape.path = UIBezierPath(roundedRect: self.borderVw.bounds, cornerRadius: self.borderVw.layer.cornerRadius).cgPath
        
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        self.borderVw.layer.addSublayer(gradient)
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(didTap(_:)))
        tap.numberOfTapsRequired = 2
        imageVIew.addGestureRecognizer(tap)
    }
    
    func changeHeart(){
        isChecked = !isChecked
        
        if isChecked {
            like.setImage(UIImage(named:"Heart-red"), for: .normal)
            isChecked = true
        } else {
            like.setImage(UIImage(named:"Heart"), for: .normal)
            isChecked = false
        }
    }
    
    @objc private func didTap(_ gesture: UITapGestureRecognizer) {
        
        guard let gestureView = gesture.view else { return }
        
        let size = gestureView.frame.size.width / 4
        let imgHearth = UIImageView(image: UIImage(systemName: "heart.fill"))
        
        imgHearth.alpha = 0.0
        imgHearth.tintColor = .white
        imgHearth.contentMode = .scaleAspectFit
        imgHearth.frame = CGRect(x: (gestureView.frame.width - size) / 2,
                                 y: (gestureView.frame.height - size) / 2,
                                 width: size,
                                 height: size)
        
        gestureView.addSubview(imgHearth)
        
        UIView.animate(withDuration: 0.5, animations: {
            imgHearth.alpha = 1.0
        }) { (completed) in
            if completed {
                
                UIView.animate(withDuration: 0.5, animations: {
                    imgHearth.alpha = 0.0
                }) { (completed) in
                    if completed {
                        imgHearth.removeFromSuperview()
                    }
                }
            }
        }
        changeHeart()
    }
    
    //MARK: Actions
    
    @IBAction func likePressed(_ sender: Any) {
        changeHeart()
    }
    
    @IBAction func commentPressed(_ sender: Any) {
    }
    
    @IBAction func sharePressed(_ sender: Any) {
    }
    
    @IBAction func savePressed(_ sender: Any) {
    }
}
