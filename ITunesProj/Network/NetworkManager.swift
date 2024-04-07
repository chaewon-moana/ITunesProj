//
//  NetworkManager.swift
//  ITunesProj
//
//  Created by cho on 4/7/24.
//

import Foundation
import Alamofire

final class NetworkManager {
    let baseUrl = "https://itunes.apple.com/search?country=KR&media=software&term="
    
    func request(term: String, complectionHandler: @escaping (SearchData) -> Void) {
        let url = baseUrl + "\(term)"
        AF.request(url).responseDecodable(of: SearchData.self) { response in
            switch response.result {
            case .success(let success):
                print(success)
                complectionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
