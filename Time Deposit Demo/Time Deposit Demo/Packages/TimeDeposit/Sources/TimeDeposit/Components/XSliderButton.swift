//
//  XSliderButton.swift
//
//
//  Created by Damon Ng on 27/9/22.
//

import UIKit

@objc public protocol XSliderButtonDelegate {
    func xSliderButtonDelegateDidFinish(_ sender: XSliderButtonView)
}

@objcMembers public class XSliderButtonView: UIView {
    // MARK: All Views
    public let textLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public let thumnailImageView: MTRoundImageView = {
        let view = MTRoundImageView()
        view.isUserInteractionEnabled = true
        view.contentMode = .center
        return view
    }()
    
    public let sliderHolderView: UIView = {
        let view = UIView()
        return view
    }()
    
    public let draggedView: UIView = {
        let view = UIView()
        return view
    }()
    
    public let view: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: Public properties
    public weak var delegate: XSliderButtonDelegate?
    public var animationVelocity: Double = 0.2
    public var sliderViewTopDistance: CGFloat = 0.0 {
        didSet {
            topSliderConstraint?.constant = sliderViewTopDistance
            layoutIfNeeded()
        }
    }
    
    public var thumbnailViewTopDistance: CGFloat = 8.0 {
        didSet {
            topThumbnailViewConstraint?.constant = thumbnailViewTopDistance
            layoutIfNeeded()
        }
    }
    
    public var thumbnailViewStartingDistance: CGFloat = 8.0 {
        didSet {
            leadingThumbnailViewConstraint?.constant = thumbnailViewStartingDistance
            trailingDraggedViewConstraint?.constant = thumbnailViewStartingDistance
            setNeedsLayout()
        }
    }
    
    public var textLabelLeadingDistance: CGFloat = 0 {
        didSet {
            leadingTextLabelConstraint?.constant = textLabelLeadingDistance
            setNeedsLayout()
        }
    }
    public var isEnabled:Bool = true {
        didSet {
            animationChangedEnabledBlock?(isEnabled)
        }
    }
    
    public var animationChangedEnabledBlock:((Bool) -> Void)?
    
    // MARK: Default styles
    public var textColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet {
            textLabel.textColor = textColor
        }
    }
    
    public var thumbnailColor: UIColor = .white {
        didSet {
            thumnailImageView.backgroundColor = thumbnailColor
        }
    }
    
    public var labelText: String = "Swipe to withdraw" {
        didSet {
            textLabel.text = labelText
        }
    }
    
    public var textFont: UIFont = UIFont(name: "OpenSans-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16) {
        didSet {
            textLabel.font = textFont
        }
    }
    
    // MARK: Private Properties
    private var backgroundGradientLayer: CAGradientLayer?
    private var leadingThumbnailViewConstraint: NSLayoutConstraint?
    private var leadingTextLabelConstraint: NSLayoutConstraint?
    private var topSliderConstraint: NSLayoutConstraint?
    private var topThumbnailViewConstraint: NSLayoutConstraint?
    private var trailingDraggedViewConstraint: NSLayoutConstraint?
    private var xPositionInThumbnailView: CGFloat = 0
    private var xEndingPoint: CGFloat {
        get {
            return (self.view.frame.maxX - thumnailImageView.bounds.width - thumbnailViewStartingDistance)
        }
    }
    private var isFinished: Bool = false
    private var panGestureRecognizer: UIPanGestureRecognizer!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    public override func layoutSubviews() {
        applyGradient(colors: [
            ThemeColors.sliderGradient1,
            ThemeColors.sliderGradient2
        ])
    }
    
    @discardableResult
    func applyGradient(colors: [UIColor]) -> CAGradientLayer {
        if let gradientLayer = backgroundGradientLayer {
            gradientLayer.frame = sliderHolderView.bounds
            gradientLayer.cornerRadius = sliderHolderView.bounds.height.half
            gradientLayer.colors = colors.map { $0.cgColor }
            return gradientLayer
        }
        let gradientLayer = sliderHolderView.addGradient(colors: colors)
        gradientLayer.cornerRadius = sliderHolderView.bounds.height.half
        backgroundGradientLayer = gradientLayer
        return gradientLayer
    }
    
    private func setupView() {
        self.addSubview(view)
        view.addSubview(thumnailImageView)
        view.addSubview(sliderHolderView)
        view.addSubview(draggedView)
        sliderHolderView.addSubview(textLabel)
        view.bringSubviewToFront(self.thumnailImageView)
        setupConstraint()
        setStyle()
        // Add pan gesture
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(_:)))
        panGestureRecognizer.minimumNumberOfTouches = 1
        thumnailImageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setupConstraint() {
        view.translatesAutoresizingMaskIntoConstraints = false
        thumnailImageView.translatesAutoresizingMaskIntoConstraints = false
        sliderHolderView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        draggedView.translatesAutoresizingMaskIntoConstraints = false
        // Setup for view
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        // Setup for circle View
        leadingThumbnailViewConstraint = thumnailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        leadingThumbnailViewConstraint?.constant = thumbnailViewStartingDistance
        leadingThumbnailViewConstraint?.isActive = true
        topThumbnailViewConstraint = thumnailImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: thumbnailViewTopDistance)
        topThumbnailViewConstraint?.isActive = true
        thumnailImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        thumnailImageView.heightAnchor.constraint(equalTo: thumnailImageView.widthAnchor).isActive = true
        // Setup for slider holder view
        topSliderConstraint = sliderHolderView.topAnchor.constraint(equalTo: view.topAnchor, constant: sliderViewTopDistance)
        topSliderConstraint?.isActive = true
        sliderHolderView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        sliderHolderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sliderHolderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // Setup for textLabel
        textLabel.topAnchor.constraint(equalTo: sliderHolderView.topAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: sliderHolderView.centerYAnchor).isActive = true
        leadingTextLabelConstraint = textLabel.leadingAnchor.constraint(equalTo: sliderHolderView.leadingAnchor, constant: textLabelLeadingDistance)
        leadingTextLabelConstraint?.isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat(-8)).isActive = true
        // Setup for Dragged View
        draggedView.leadingAnchor.constraint(equalTo: sliderHolderView.leadingAnchor).isActive = true
        draggedView.topAnchor.constraint(equalTo: sliderHolderView.topAnchor).isActive = true
        draggedView.centerYAnchor.constraint(equalTo: sliderHolderView.centerYAnchor).isActive = true
        trailingDraggedViewConstraint = draggedView.trailingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: thumbnailViewStartingDistance)
        trailingDraggedViewConstraint?.isActive = true
    }
    
    private func setStyle() {
        thumnailImageView.backgroundColor = thumbnailColor
        textLabel.text = labelText
        textLabel.font = textFont
        textLabel.textColor = textColor
        textLabel.textAlignment = .center
        
        sliderHolderView.layer.cornerRadius = sliderHolderView.layer.cornerRadius.half
        draggedView.layer.cornerRadius = draggedView.layer.cornerRadius.half
    }
    
    private func isTapOnThumbnailViewWithPoint(_ point: CGPoint) -> Bool{
        return self.thumnailImageView.frame.contains(point)
    }
    
    private func updateThumbnailXPosition(_ x: CGFloat) {
        leadingThumbnailViewConstraint?.constant = x
        setNeedsLayout()
    }
    
    // MARK: UIPanGestureRecognizer
    @objc private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        if isFinished || !isEnabled {
            return
        }
        let translatedPoint = sender.translation(in: view).x
        switch sender.state {
        case .began:
            break
        case .changed:
            if translatedPoint >= xEndingPoint {
                updateThumbnailXPosition(xEndingPoint)
                return
            }
            if translatedPoint <= thumbnailViewStartingDistance {
                textLabel.alpha = 1
                updateThumbnailXPosition(thumbnailViewStartingDistance)
                return
            }
            updateThumbnailXPosition(translatedPoint)
            textLabel.alpha = (xEndingPoint - translatedPoint) / xEndingPoint
            break
        case .ended:
            if translatedPoint >= xEndingPoint {
                textLabel.alpha = 0
                updateThumbnailXPosition(xEndingPoint)
                // Finish action
                isFinished = true
                delegate?.xSliderButtonDelegateDidFinish(self)
                return
            }
            if translatedPoint <= thumbnailViewStartingDistance {
                textLabel.alpha = 1
                updateThumbnailXPosition(thumbnailViewStartingDistance)
                return
            }
            UIView.animate(withDuration: animationVelocity) {
                self.leadingThumbnailViewConstraint?.constant = self.thumbnailViewStartingDistance
                self.textLabel.alpha = 1
                self.layoutIfNeeded()
            }
            break
        default:
            break
        }
    }
    // Others
    public func resetStateWithAnimation(_ animated: Bool) {
        let action = {
            self.leadingThumbnailViewConstraint?.constant = self.thumbnailViewStartingDistance
            self.textLabel.alpha = 1
            self.layoutIfNeeded()
            //
            self.isFinished = false
        }
        if animated {
            UIView.animate(withDuration: animationVelocity) {
                action()
            }
        } else {
            action()
        }
    }
}

public class MTRoundImageView: UIView {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "icon-chevron-double", in: Bundle.module, compatibleWith: nil)
        imageView.image = image?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .center
        imageView.tintColor = UIColor(red: 0.286, green: 0.282, blue: 0.282, alpha: 1)
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width.half
    }
    
    private func setup() {
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.fillSuperview()
    }
}
