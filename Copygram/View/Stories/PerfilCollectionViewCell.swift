//
//  CollectionViewCell.swift
//  Copygram
//
//  Created by Felipe Medeiros on 22/09/22.
//

import UIKit

class PerfilCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var borderVW: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var hasSeen = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.borderVW.frame.size)
        gradient.colors =  [UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.systemPink.cgColor, UIColor.purple.cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 6
        
        shape.path = UIBezierPath(roundedRect: self.borderVW.bounds, cornerRadius: self.borderVW.layer.cornerRadius).cgPath
        
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        self.borderVW.layer.addSublayer(gradient)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        imageView.layer.cornerRadius = imageView.frame.height/2
        borderVW.layer.cornerRadius = borderVW.frame.height/2
        borderVW.clipsToBounds = false
        self.borderVW.layer.cornerRadius = self.borderVW.frame.height/2
        self.borderVW.clipsToBounds = true
        label.text = "@seacella._"

    }
    func setupUI() {
 
        if hasSeen == false{
            let gradient = CAGradientLayer()
            gradient.frame =  CGRect(origin: CGPoint.zero, size: self.borderVW.frame.size)
            gradient.colors =  [UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.systemPink.cgColor, UIColor.purple.cgColor]

            let shape = CAShapeLayer()
            shape.lineWidth = 6

            shape.path = UIBezierPath(roundedRect: self.borderVW.bounds, cornerRadius: self.borderVW.layer.cornerRadius).cgPath

            shape.strokeColor = UIColor.white.cgColor
            shape.fillColor = UIColor.clear.cgColor
            gradient.mask = shape

            self.borderVW.layer.addSublayer(gradient)
        }else{
            borderVW.layer.borderWidth = 2
            borderVW.layer.borderColor = UIColor.gray.cgColor
        }
        
    }

}
