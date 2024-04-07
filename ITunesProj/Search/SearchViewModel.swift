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
    lazy var items = BehaviorRelay(value: searchData)
    
    struct Input {
        let searchText: ControlProperty<String>
        let searchButtonTap: ControlEvent<Void>
    }
    
    struct Output {
        let searchList: PublishSubject<[SoftwareInfo]>
    }
    
    func transform(input: Input) -> Output {
        let searchList = PublishSubject<[SoftwareInfo]>()
        let screenShotList = PublishSubject<[String]>()
        
         input.searchButtonTap
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .subscribe(with: self) { owner, value in
                NetworkManager().request(term: value) { data in
                    owner.items.accept(data.results)
                    searchList.onNext(data.results)
                }
            }
            .disposed(by: disposeBag)
        
        
        
        
        return Output(searchList: searchList)
    }
}
