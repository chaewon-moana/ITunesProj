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
    let titleLabel = UILabel()
    let downloadButton = UIButton()
    let starRateImage = UIImageView()
    let starRateLabel = UILabel()
    let artistName = UILabel()
    let genres = UILabel() //배열로 받아옴
    let backView = UIStackView()
    let screenShotScrollView = UIScrollView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureAttribute()
    }

    private func configureAttribute() {
        contentView.addSubviews([IconImage, titleLabel, downloadButton, starRateImage, starRateLabel, artistName, genres, screenShotScrollView])
        screenShotScrollView.addSubview(backView)
        IconImage.snp.makeConstraints { make in
            make.size.equalTo(52)
            make.top.leading.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        titleLabel.snp.makeConstraints { make in
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
        backView.snp.makeConstraints { make in
            make.height.equalTo(screenShotScrollView)
            make.horizontalEdges.equalTo(screenShotScrollView)
        }
        
        IconImage.clipsToBounds = true
        IconImage.layer.cornerRadius = 8
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
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
     
        backView.axis = .vertical
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        screenShotCollectionView.delegate = nil
//        screenShotCollectionView.dataSource = nil
    }
    
    //TODO: stackView 쌓아서 차례차례 나오도록 만들기,,,,
    func screenShot(_ list: [String]) {
        print("작동은 되구 있구만유")
        for idx in list {
            let url = URL(string: idx)
            let screenShot = UIImageView()
            screenShot.backgroundColor = .red
            screenShot.contentMode = .scaleAspectFill
            backView.addSubview(screenShot)
            screenShot.snp.makeConstraints { make in
                make.verticalEdges.equalToSuperview().inset(8)
                make.width.equalTo(80)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
