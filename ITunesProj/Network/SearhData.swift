//
//  SearhData.swift
//  ITunesProj
//
//  Created by cho on 4/6/24.
//

import Foundation

struct SearchData: Decodable {
    let resultCount: Int
    let results: [SoftwareInfo]
}


struct SoftwareInfo: Decodable {
    let artworkUrl60: String
    let screenshotUrls: [String]
    let releaseNotes: String?
    let artistName: String
    let genres: [String]
  //  let price: Double
    let description: String
    let trackName: String
    let currentVersionReleaseDate: String
    let primaryGenreName: String
    let averageUserRating: Double
    let minimumOsVersion: String
    let trackCensoredName: String
    let trackContentRating: String
    let sellerName: String
    let version: String
}
//struct SoftwareInfo: Decodable {
//    let artistViewURL: String //같은 제작자가 만든 앱 확인
//    let artworkUrl60: String//, artworkUrl512. artworkUrl100: String //일단 작은 이미지로 처리
//  //  let isGameCenterEnabled: Bool
//    let advisories: [String]
//    let screenshotUrls: [String]
//    //let ipadScreenshotUrls, appletvScreenshotUrls: [JSONAny]
//    let supportedDevices: [String]
//   // let features: [JSONAny]
//    let kind: String //iTunes 중에 앱을 확인
//    let averageUserRating: Double
//   // let trackCensoredName: String
//  //  let trackViewURL: String
//    let contentAdvisoryRating, currency, minimumOSVersion: String
//    let averageUserRatingForCurrentVersion: Double
//    let fileSizeBytes, formattedPrice: String
//    //let userRatingCountForCurrentVersion: Double
//    let trackContentRating: String
////    let artistID: Int
//    let artistName: String
//    let genres: [String]
//    let price: Int
//    let description, sellerName, releaseNotes: String
//  //  let isVppDeviceBasedLicensingEnabled: Bool
//  //  let trackID: Int
//    let trackName: String //메인네임
//  //  let languageCodesISO2A: [String]
// //  let bundleID: String
//  //  let genreIDS: [String]
//    let primaryGenreName: String
//  //  let primaryGenreID: Int
//   // let releaseDate: String
//   // let currentVersionReleaseDate: String
//    let version, wrapperType: String
//    let userRatingCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case artistViewURL = "artistViewUrl"
//        case artworkUrl60, isGameCenterEnabled, advisories, screenshotUrls, supportedDevices, kind, averageUserRating, trackCensoredName
//        case trackViewURL = "trackViewUrl"
//        case contentAdvisoryRating, currency
//        case minimumOSVersion = "minimumOsVersion"
//        case averageUserRatingForCurrentVersion, fileSizeBytes, formattedPrice, userRatingCountForCurrentVersion, trackContentRating
//        case artistID = "artistId"
//        case artistName, genres, price, description, sellerName, releaseNotes, isVppDeviceBasedLicensingEnabled
//        case trackID = "trackId"
//        case trackName, languageCodesISO2A
//        case bundleID = "bundleId"
//        case genreIDS = "genreIds"
//        case primaryGenreName
//        case primaryGenreID = "primaryGenreId"
//        case releaseDate, currentVersionReleaseDate, version, wrapperType, userRatingCount
//    }
//}
//
