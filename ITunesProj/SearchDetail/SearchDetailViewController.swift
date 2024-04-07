//
//  SearchDetailViewController.swift
//  ITunesProj
//
//  Created by cho on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

final class SearchDetailViewController: UIViewController {
    
    var item: SoftwareInfo?
    let disposeBag = DisposeBag()
    
    let backView = UIView()
    let scrollView = UIScrollView()
    let iconImage = UIImageView()
    let titleLabel = UILabel()
    let artistName = UILabel()
    let downloadButton = UIButton()
    let updateLabel = UILabel()
    let versionLabel = UILabel()
    let releaseNoteLabel = UILabel()
    let screenShotCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
        screenShotCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        bind()
        configureView()
    }
    
    private func bind() {
        guard let item = item else { return }
        let screenShotList = BehaviorSubject(value: item.screenshotUrls)
        screenShotList
            .bind(to: screenShotCollectionView.rx.items(cellIdentifier: SearchCollectionViewCell.identifier, cellType: SearchCollectionViewCell.self)) {
                (item, element, cell) in
                let url = URL(string: element)
                cell.screenShotImage.kf.setImage(with: url)
            }
            .disposed(by: disposeBag)
    }
    
    private func configureView() {
        view.addSubview(scrollView)
        scrollView.addSubview(backView)
        backView.addSubviews([iconImage, titleLabel, artistName, downloadButton, updateLabel, versionLabel, releaseNoteLabel, screenShotCollectionView, descriptionLabel])
        
        scrollView.isUserInteractionEnabled = true
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view)
        }
        backView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }

        iconImage.snp.makeConstraints { make in
            make.size.equalTo(80)
            make.top.leading.equalToSuperview().offset(8)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImage.snp.trailing).offset(6)
            make.top.equalTo(iconImage).offset(8)
        }
        artistName.snp.makeConstraints { make in
            make.leading.equalTo(iconImage.snp.trailing).offset(6)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        downloadButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(28)
            make.leading.equalTo(iconImage.snp.trailing).offset(6)
            make.top.equalTo(artistName.snp.bottom).offset(4)
        }
        updateLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
        }
        versionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalTo(updateLabel.snp.bottom).offset(8)
        }
        releaseNoteLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalTo(versionLabel.snp.bottom).offset(16)
        }
        screenShotCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8)
            make.top.equalTo(releaseNoteLabel.snp.bottom).offset(8)
            make.height.equalTo(400)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(screenShotCollectionView.snp.bottom).offset(16)
            make.horizontalEdges.bottom.equalToSuperview().inset(8)
        }
        
        guard let item = item else { return }
        let url = URL(string: item.artworkUrl60)
        iconImage.kf.setImage(with: url)
        iconImage.clipsToBounds = true
        iconImage.layer.cornerRadius = 8
        titleLabel.text = item.trackName
        artistName.text = item.artistName
        versionLabel.text = "버전 \(item.version)"
        versionLabel.font = .systemFont(ofSize: 12)
        versionLabel.textColor = .lightGray
        releaseNoteLabel.numberOfLines = 0
        releaseNoteLabel.text = item.releaseNotes ?? "업데이트 사항 없음"
        releaseNoteLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.text = item.description
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        artistName.font = .systemFont(ofSize: 13)
        artistName.textColor = .lightGray
        
        downloadButton.setTitle("받기", for: .normal)
        downloadButton.backgroundColor = .systemBlue
        downloadButton.layer.cornerRadius = 8
        updateLabel.text = "새로운 소식"
     
    }
    
    static func collectionViewLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        
        let cellWidth = UIScreen.main.bounds.width - 20
        let itemWidth = cellWidth / 1.3
        let itemHeight = itemWidth * 1.7
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.scrollDirection = .horizontal
        //layout.minimumLineSpacing = 30
        return layout
    }
}
