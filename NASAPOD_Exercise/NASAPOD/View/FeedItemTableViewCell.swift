//
//  FeedItemCell.swift
//  NASAPOD
//
//  Created by Augustus Wilson on 7/15/21.
//  Copyright © 2021 Augustus Wilson. All rights reserved.
//

import UIKit

class FeedItemTableViewCell: UITableViewCell  {
    
    internal let podImage : UIImageView = {
        let imageView =  UIImageView(frame: .zero)
        imageView.accessibilityIdentifier = "FeedItem Image"
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.backgroundColor = .lightGray;
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView;
    }()
    
    internal let podTitle : UILabel  = {
        let label  =  UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.accessibilityIdentifier = "FeedItem Name"
        label.font = UIFont.init(name: "AvenirNext-Regular", size: 18.0)
        label.numberOfLines = 0
        return label;
    }()
    
    internal let dateTaken : UILabel  = {
        let label  =  UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.accessibilityIdentifier = "Artist Name"
        label.font = UIFont.init(name: "AvenirNext-Regular", size: 16.0)
        label.textColor = .gray
        return label;
    }()
    
    private var placeholderView : UIStackView =   {
        let view =  UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupContraints();
        accessoryType = .disclosureIndicator
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContraints();
        accessoryType = .disclosureIndicator
    }

    internal func setupContraints() {
        addSubview(podImage)
        addSubview(placeholderView)
        placeholderView.addArrangedSubview(podTitle)
        placeholderView.addArrangedSubview(dateTaken)

        NSLayoutConstraint.activate([
            podImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            podImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 8),
            podImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
            podImage.widthAnchor.constraint(equalToConstant: 100),
            podImage.heightAnchor.constraint(equalToConstant: 100.0)
        ])
        
        NSLayoutConstraint.activate([
            placeholderView.topAnchor.constraint(equalTo:self.topAnchor),
            placeholderView.leadingAnchor.constraint(equalTo: podImage.trailingAnchor,constant: 8),
            placeholderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            placeholderView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    internal func refreshWith(feedItem: FeedItem) {
        podTitle.text = feedItem.title
        dateTaken.text = feedItem.date
        podImage.loadImageUsingCache(withUrl: feedItem.url)
    }
}
