//
//  SearchViewModel.swift
//  ITunesProj
//
//  Created by cho on 4/6/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    let disposeBag = DisposeBag()
    
    var searchData: [SoftwareInfo] = []
    
    struct Input {
        let searchText: ControlProperty<String>
        let searchButtonTap: ControlEvent<Void>
    }
    
    struct Output {
        let searchList: PublishRelay<[SoftwareInfo]>
    }
    
    func transform(input: Input) -> Output {
        let searchList = PublishRelay<[SoftwareInfo]>()
        
         input.searchButtonTap
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .subscribe(with: self) { owner, value in
                print("서치버튼 눌림")
                NetworkManager().request(term: value) { data in
                    searchList.accept(data.results)
                }
            }
            .disposed(by: disposeBag)
        
        return Output(searchList: searchList)
    }
}
