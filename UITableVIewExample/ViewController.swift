//
//  ViewController.swift
//  UITableVIewExample
//
//  Created by 장공의 on 27/05/2019.
//  Copyright © 2019 gonini. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    fileprivate let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func addView() {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom
                .equalTo(view.safeAreaLayoutGuide)
            
        }
    }
}

