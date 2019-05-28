//
//  SingleImageCell.swift
//  UITableVIewExample
//
//  Created by 장공의 on 28/05/2019.
//  Copyright © 2019 gonini. All rights reserved.
//

import UIKit
import Kingfisher

class SingleImageCell: UITableViewCell {

    private let singleImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addView()
    }
    
    func updateSingleImage(url: URL) {
        singleImageView.kf.setImage(with: url)
    }
    
    private func addView() {
        addSubview(singleImageView)
    }
}
