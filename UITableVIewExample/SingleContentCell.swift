//
//  SingleImageCell.swift
//  UITableVIewExample
//
//  Created by 장공의 on 28/05/2019.
//  Copyright © 2019 gonini. All rights reserved.
//

import UIKit
import Kingfisher

class SingleContentCell: UITableViewCell {

    static let id = "singleImageCell"
    
    private let singleImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    var singleContent: SingleContent? = nil {
        didSet {
            guard let content = self.singleContent else {
                return
            }
            
            titleLabel.text = content.title
            singleImageView.kf.setImage(with: content.contentUrl)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        addSubview(singleImageView)
        addSubview(titleLabel)
        
        singleImageView.snp.makeConstraints { make in
            make.left.top.bottom
                .equalTo(self)
                .labeled("\(singleImageView) leading top bottom equalTo self")
            
            make.width
                .equalTo(100)
                .labeled("\(singleImageView) width equalTo 100")
        }
        
        titleLabel.snp.makeConstraints { make in
            titleLabel.textAlignment = .center

            make.size
                .equalTo(titleLabel)
                .labeled("\(titleLabel) size equalTo titleLabel")
            
            make.top.right.bottom
                .equalTo(self)
                .labeled("\(titleLabel) top trailing bottom equalTo self")

            make.left
                .equalTo(singleImageView.snp.right)
                .labeled("\(titleLabel) leading equalTo singleImageView.snp.trailing")
        }
    }
}

struct SingleContent {
    let title: String
    let contentUrl: URL
    
    init(url: URL) {
        self.title = url.absoluteString
        self.contentUrl = url
    }
}

