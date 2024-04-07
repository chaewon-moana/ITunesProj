//
//  SearchViewController.swift
//  ITunesProj
//
//  Created by cho on 4/6/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

final class SearchViewController: UIViewController {
    let disposeBag = DisposeBag()
    let searchBar = UISearchBar()
    let tableView = UITableView()
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        view.backgroundColor = .white
        configureView()
        tableView.rowHeight = 300
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "검색"
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
    }

    private func bind() {
        
        let input = SearchViewModel.Input(searchText: searchBar.rx.text.orEmpty, searchButtonTap: searchBar.rx.searchButtonClicked)
        
        let output = viewModel.transform(input: input)
        
        output.searchList
            .bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { (row, element, cell) in
                
                cell.title.text = element.trackName
                let url = URL(string: element.artworkUrl60)
                cell.IconImage.kf.setImage(with: url)
            
                cell.starRateLabel.text = String(format: "%.1f", element.averageUserRating)
                cell.artistName.text = element.artistName
                cell.genres.text = element.genres.first ?? ""
                
                let screenShotList = BehaviorSubject(value:element.screenshotUrls)
                screenShotList
                    .bind(to: cell.screenShotCollectionView.rx.items(cellIdentifier: SearchCollectionViewCell.identifier, cellType: SearchCollectionViewCell.self)) { (item, element, cell) in
                        let screenshot = URL(string: element)
                        cell.screenShotImage.kf.setImage(with: screenshot)
                    }
                    .disposed(by: cell.disposeBag)
            }
            .disposed(by: disposeBag)
        
    }
    
    private func configureView() {
        view.addSubviews([searchBar, tableView])
     
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(36)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.horizontalEdges.bottom.equalTo(view.safeAreaInsets).inset(8)
        }
        searchBar.placeholder = "게임, 앱, 스토리 등"
        searchBar.searchBarStyle = .minimal
    }
}

