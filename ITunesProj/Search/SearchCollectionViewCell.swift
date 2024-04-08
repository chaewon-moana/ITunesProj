//
//  SearchCollectionViewCell.swift
//  ITunesProj
//
//  Created by cho on 4/7/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SearchCollectionViewCell: UICollectionViewCell {
    let screenShotImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        contentView.addSubview(screenShotImage)
        screenShotImage.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        screenShotImage.clipsToBounds = true
        screenShotImage.layer.cornerRadius = 8
        screenShotImage.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
