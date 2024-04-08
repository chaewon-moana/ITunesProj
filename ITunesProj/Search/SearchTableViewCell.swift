//
//  SearchTableViewCell.swift
//  ITunesProj
//
//  Created by cho on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SearchTableViewCell: UITableViewCell {
    
    let disposeBag = DisposeBag()
    
    let IconImage = UIImageView()
    let title = UILabel()
    let downloadButton = UIButton()
    let starRateImage = UIImageView()
    let starRateLabel = UILabel()
    let artistName = UILabel()
    let genres = UILabel() //배열로 받아옴
    let screenShotScrollView = UIScrollView()
    //let screenShotCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /*screenShotCollectionView.register(SearchCollectionViewCell.self, forCellWithR*/euseIdentifier: SearchCollectionViewCell.identifier)
        configureAttribute()
    }
//        static func collectionViewLayout() -> UICollectionViewFlowLayout{
//            let layout = UICollectionViewFlowLayout()
//            
//            let cellWidth = UIScreen.main.bounds.width - 20
//            let itemWidth = cellWidth / 3
//            let itemHeight = itemWidth * 1.7
//            
//            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
//            layout.scrollDirection = .horizontal
////            layout.minimumLineSpacing = 30
//            layout.minimumInteritemSpacing = 30
//            return layout
//}
    private func configureAttribute() {
        contentView.addSubviews([IconImage, title, downloadButton, starRateImage, starRateLabel, artistName, genres, screenShotScrollView])
        IconImage.snp.makeConstraints { make in
            make.size.equalTo(52)
            make.top.leading.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        title.snp.makeConstraints { make in
            make.leading.equalTo(IconImage.snp.trailing).offset(12)
            make.centerY.equalTo(IconImage)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-4)
        }
        downloadButton.snp.makeConstraints { make in
            make.width.equalTo(52)
            make.height.equalTo(24)
            make.centerY.equalTo(IconImage)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(12)
        }
        starRateImage.snp.makeConstraints { make in
            make.size.equalTo(18)
            make.leading.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.top.equalTo(IconImage.snp.bottom).offset(6)
        }
        starRateLabel.snp.makeConstraints { make in
            make.leading.equalTo(starRateImage.snp.trailing).offset(4)
            make.top.equalTo(starRateImage)
        }
        artistName.snp.makeConstraints { make in
            make.centerX.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(starRateLabel)
        }
        genres.snp.makeConstraints { make in
            make.trailing.equalTo(self.safeAreaLayoutGuide).inset(8)
            make.top.equalTo(starRateLabel)
        }
        screenShotScrollView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(starRateImage.snp.bottom).offset(8)
        }
        IconImage.clipsToBounds = true
        IconImage.layer.cornerRadius = 8
        title.font = .systemFont(ofSize: 17, weight: .bold)
        starRateImage.image = UIImage(systemName: "star.fill")
        starRateImage.tintColor = .systemBlue
        starRateLabel.font = .systemFont(ofSize: 13)
        starRateLabel.textColor = .lightGray
        downloadButton.layer.cornerRadius = 12
        downloadButton.backgroundColor = .gray
        downloadButton.setTitle("받기", for: .normal)
        
        artistName.font = .systemFont(ofSize: 13)
        artistName.textColor = .lightGray
        genres.font = .systemFont(ofSize: 13)
        genres.textColor = .lightGray
     
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        screenShotCollectionView.delegate = nil
        screenShotCollectionView.dataSource = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
