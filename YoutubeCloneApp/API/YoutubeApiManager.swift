//
// YoutubeApiManager.swift
// YoutubeCloneApp
//
// Created by t2023-m0050 on 2023/09/06.
//

import Foundation

final class YoutubeApiManager {
    //싱글톤
    static let shared = YoutubeApiManager()
    private init() {}

    let BASE_URL = "https://youtube.googleapis.com/youtube/v3/search"

    func fetchVideo(completion: @escaping (Thumbnails?) -> Void) {
        let urlString = "\(BASE_URL)?part=snippet&type=video&key=\(LUNA_KEY)"
        
        request(with: urlString) { thumbnails in
            completion(thumbnails)
        }
    }
        
        func fetchVideo2(completion: @escaping (Thumbnails?) -> Void) {
            let urlString2 = "\(BASE_URL)?part=snippet&order=viewCount&type=video&key=\(LUNA_KEY)"

            request(with: urlString2) { thumbnails in
                completion(thumbnails)
            }
    }

    func request(with urlString: String, completion: @escaping (Thumbnails?) -> Void) {
        guard let url = URL(string: urlString) else { return }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { data, response, error in

            if error != nil {
                print(error!)
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
                print("HTTP Response Error")
                completion(nil)
                return
            }

            guard let safeData = data else {
                print("데이터를 받아오지 못했습니다")
                completion(nil)
                return
            }

            if let thumbnails = self.parseJSON(safeData) {
                completion(thumbnails)
            } else {
                print("JSON 파싱 에러")
                completion(nil)
            }
        }

        task.resume()
    }

    func parseJSON(_ videoData: Data) -> Thumbnails? {
        print("videData: \(videoData)")
        let decoder = JSONDecoder()

        do {
            let decodedData = try decoder.decode(Thumbnails.self, from: videoData)
            print("decodedData: \(decodedData)")
            return decodedData

        } catch {
            print("JSON 디코딩 실패: \(error)")
            return nil
        }
    }
}
