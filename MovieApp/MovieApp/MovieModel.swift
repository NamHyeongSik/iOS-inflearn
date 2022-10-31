//
//  MovieModel.swift
//  MovieApp
//
//  Created by HYEONG SIK NAM on 2022/04/06.
//

import Foundation

struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult]
}

struct MovieResult: Codable {
    //json의 key값과 완전히 똑같이 씀
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?
    
    //만약 똑같이 안쓰고 싶다면 다음의 과정을 거쳐야함
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName // 전부 다 적어줘야 하며 그대로 쓰고 싶다면 우항을 비워두면 됨
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
        case releaseDate
    }
}
