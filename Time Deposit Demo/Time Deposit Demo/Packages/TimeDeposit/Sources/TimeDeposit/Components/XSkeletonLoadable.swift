//
//  XSkeletonLoader.swift
//  
//
//  Created by Damon Ng on 12/10/22.
//

import UIKit

public class XSkeletonLoader: UIView {
    // MARK: UI Elements
    let dummyLabel1 = UILabel()
    let dummyLayer1 = CAGradientLayer()
    let dummyLabel2 = UILabel()
    let dummyLayer2 = CAGradientLayer()
    let dummyLabel3 = UILabel()
    let dummyLayer3 = CAGradientLayer()
    let dummyLabel4 = UILabel()
    let dummyLayer4 = CAGradientLayer()
    let dummyLabel5 = UILabel()
    let dummyLayer5 = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        dummyLayer1.frame = dummyLabel1.bounds
        dummyLayer2.frame = dummyLabel2.bounds
        dummyLayer3.frame = dummyLabel3.bounds
        dummyLayer4.frame = dummyLabel4.bounds
        dummyLayer5.frame = dummyLabel5.bounds
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        dummyLabel1.translatesAutoresizingMaskIntoConstraints = false
        dummyLabel2.translatesAutoresizingMaskIntoConstraints = false
        dummyLabel3.translatesAutoresizingMaskIntoConstraints = false
        dummyLabel4.translatesAutoresizingMaskIntoConstraints = false
        dummyLabel5.translatesAutoresizingMaskIntoConstraints = false
        
        dummyLabel1.layer.masksToBounds = true
        dummyLabel2.layer.masksToBounds = true
        dummyLabel3.layer.masksToBounds = true
        dummyLabel4.layer.masksToBounds = true
        dummyLabel5.layer.masksToBounds = true
        
        dummyLayer1.colors = [ThemeColors.skeletonLoaderGradient1.cgColor, ThemeColors.skeletonLoaderGradient2.cgColor]
        dummyLabel1.layer.addSublayer(dummyLayer1)
        
        dummyLayer2.colors = [ThemeColors.skeletonLoaderGradient1.cgColor, ThemeColors.skeletonLoaderGradient2.cgColor]
        dummyLabel2.layer.addSublayer(dummyLayer2)
        
        dummyLayer3.colors = [ThemeColors.skeletonLoaderGradient1.cgColor, ThemeColors.skeletonLoaderGradient2.cgColor]
        dummyLabel3.layer.addSublayer(dummyLayer3)
        
        dummyLayer4.colors = [ThemeColors.skeletonLoaderGradient1.cgColor, ThemeColors.skeletonLoaderGradient2.cgColor]
        dummyLabel4.layer.addSublayer(dummyLayer4)
        
        dummyLayer5.colors = [ThemeColors.skeletonLoaderGradient1.cgColor, ThemeColors.skeletonLoaderGradient2.cgColor]
        dummyLabel5.layer.addSublayer(dummyLayer5)
        
        let startPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnim.fromValue = CGPoint(x: -0.25, y: 0.5)
        startPointAnim.toValue = CGPoint(x: 0.25, y: 0.5)
        
        let endPointAnim = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnim.fromValue = CGPoint(x: 0.5, y: 0.5)
        endPointAnim.toValue = CGPoint(x: 0.75, y: 0.5)
        
        let animGroup = CAAnimationGroup()
        animGroup.animations = [startPointAnim, endPointAnim]
        animGroup.duration = 1
        animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animGroup.repeatCount = .infinity
        animGroup.autoreverses = true
        animGroup.isRemovedOnCompletion = false
        
        dummyLayer1.add(animGroup, forKey: "loadingAnimation")
        dummyLayer2.add(animGroup, forKey: "loadingAnimation")
        dummyLayer3.add(animGroup, forKey: "loadingAnimation")
        dummyLayer4.add(animGroup, forKey: "loadingAnimation")
        dummyLayer5.add(animGroup, forKey: "loadingAnimation")
        
        addSubview(dummyLabel1)
        addSubview(dummyLabel2)
        addSubview(dummyLabel3)
        addSubview(dummyLabel4)
        addSubview(dummyLabel5)
    }
    
    private func setLayoutConstraints() {
        NSLayoutConstraint.activate([
            dummyLabel1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dummyLabel1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dummyLabel1.heightAnchor.constraint(equalToConstant: 32),
            dummyLabel1.widthAnchor.constraint(equalToConstant: 236),
            
            dummyLabel2.topAnchor.constraint(equalTo: dummyLabel1.bottomAnchor, constant: 15),
            dummyLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dummyLabel2.heightAnchor.constraint(equalToConstant: 14),
            dummyLabel2.widthAnchor.constraint(equalToConstant: 152),
            
            dummyLabel3.topAnchor.constraint(equalTo: dummyLabel2.bottomAnchor, constant: 63),
            dummyLabel3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dummyLabel3.heightAnchor.constraint(equalToConstant: 32),
            dummyLabel3.widthAnchor.constraint(equalToConstant: 236),
            
            dummyLabel4.topAnchor.constraint(equalTo: dummyLabel3.bottomAnchor, constant: 14),
            dummyLabel4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dummyLabel4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dummyLabel4.heightAnchor.constraint(equalToConstant: 14),
            
            dummyLabel5.topAnchor.constraint(greaterThanOrEqualTo: dummyLabel4.bottomAnchor),
            dummyLabel5.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dummyLabel5.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            dummyLabel5.heightAnchor.constraint(equalToConstant: 32),
            dummyLabel5.widthAnchor.constraint(equalToConstant: 236)
        ])
    }
}
