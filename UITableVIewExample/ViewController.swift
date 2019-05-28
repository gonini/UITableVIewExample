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
        view.register(SingleContentCell.self, forCellReuseIdentifier: SingleContentCell.id)
        return view
    }()
    
    fileprivate var singleContents = [SingleContent]()
    
    fileprivate let imageService = DummyImageService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        fetchNextPage()
    }
    
    private func addView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.delegate = self
        
        tableView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom
                .equalTo(view.safeAreaLayoutGuide)
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SingleContentCell.id)
        
        guard let contentCell = cell as? SingleContentCell else {
            return .init()
        }
        
        contentCell.singleContent = singleContents[indexPath.row]
        
        return contentCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        for index in indexPaths {
            print(index.row)
        }
        
        if indexPaths.contains(where: { $0.row >= singleContents.count - 1}) {
            fetchNextPage()
        }
    }
    
    func fetchNextPage() {
        DispatchQueue.global().async { [weak self] in
            guard let `self` = self else { return }
            
            let updateAction = { (contents: [URL]) in
                self.singleContents.append(contentsOf: contents.map { SingleContent(url: $0) })
                
                DispatchQueue.main.async {
                    // 최적화 가능
                    self.tableView.reloadData()
                }
            }
            
            let base = self.singleContents.count
            self.imageService.fecth(startIndex: base, count: base + 20, updateAction)
        }
    }
}


