//
//  FeedItemDetailView.swift
//  NASAPOD
//
//  Created by Augustus Wilson on 7/15/21.
//  Copyright © 2021 Augustus Wilson. All rights reserved.
//

import UIKit

class FeedItemDetailView : UIView {
    let imageView : UIImageView = {
        let imageView =  UIImageView(frame: .zero)
        imageView.accessibilityIdentifier = "FeedItem Image"
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView;
    }()
    
    let placeholderView : UIView =   {
        let view =  UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }()
    
    let podTitle : UILabel  = {
        let label  =  UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.accessibilityIdentifier = "FeedItem Name"
        label.font = UIFont.init(name: "AvenirNext-DemiBold", size: 16.0)
        label.numberOfLines = 0
        return label;
    }()
    
    let podExplanation : UITextView  = {
        let textView  =  UITextView(frame: .zero)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false;
        textView.accessibilityIdentifier = "FeedItem Explanation"
        textView.font = UIFont.init(name: "AvenirNext-Regular", size: 14.0)
        textView.textColor = .black
        return textView;
    }()
    
    let copyright : UILabel  = {
        let label  =  UILabel(frame: .zero)
        label.numberOfLines = 0
        label.accessibilityIdentifier = "Copyright"
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.font = UIFont.init(name: "AvenirNext-Regular", size: 10.0)
        label.textColor = .gray
        return label;
    }()
    
    internal func setupContraints() {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.addSubview(imageView)
        self.addSubview(placeholderView)
        placeholderView.addSubview(podTitle)
        placeholderView.addSubview(podExplanation)
        placeholderView.addSubview(copyright)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5, constant: 1),
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1, constant: 1)

        ])
        
        NSLayoutConstraint.activate([
            placeholderView.topAnchor.constraint(equalTo:imageView.bottomAnchor),
            placeholderView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            placeholderView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            placeholderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            copyright.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor,constant: 8),
            copyright.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor,constant: -8),
            copyright.topAnchor.constraint(equalTo: placeholderView.topAnchor, constant:8),
        ])
        
        NSLayoutConstraint.activate([
            podTitle.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor,constant: 8),
            podTitle.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor,constant: -8),
            podTitle.topAnchor.constraint(equalTo: copyright.bottomAnchor, constant:8),
        ])
        
        NSLayoutConstraint.activate([
            podExplanation.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor,constant: 8),
            podExplanation.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor,constant: -8),
            podExplanation.topAnchor.constraint(equalTo: podTitle.bottomAnchor, constant:8),
            podExplanation.bottomAnchor.constraint(equalTo: placeholderView.bottomAnchor, constant:8),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContraints();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
