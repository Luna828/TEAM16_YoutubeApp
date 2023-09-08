//
//  YoutubeApiModel.swift
//  YoutubeCloneApp
//
//  Created by t2023-m0050 on 2023/09/06.
//

import Foundation

struct Thumbnails: Codable {
    let items: [Item]
    
    struct Item: Codable {
        let snippet: Snippet
    }

    struct Snippet: Codable {
        let publishedAt: String
        let title: String
        let description: String
        let thumbnails: ThumbnailSize
        let channelTitle: String
        let liveBroadcastContent: String
        let publishTime: String
    }

    struct ThumbnailSize: Codable {
        let medium: Thumbnails
        let high: Thumbnails
    }

    struct Thumbnails: Codable {
        let url: String //www.youtube.watch?/KeWqs.jpg
        let width: Int
        let height: Int
    }
}
