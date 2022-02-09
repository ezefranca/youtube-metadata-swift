import UIKit
import Foundation



public struct YTMetadataRequester {

    // MARK: -Metadata
    struct Metadata: Codable {
        let authorName: String
        let authorURL: String
        let height: Int
        let html, providerName: String
        let providerURL: String
        let thumbnailHeight: Int
        let thumbnailURL: String
        let thumbnailWidth: Int
        let title, type, version: String
        let width: Int

        enum CodingKeys: String, CodingKey {
            case authorName = "author_name"
            case authorURL = "author_url"
            case height, html
            case providerName = "provider_name"
            case providerURL = "provider_url"
            case thumbnailHeight = "thumbnail_height"
            case thumbnailURL = "thumbnail_url"
            case thumbnailWidth = "thumbnail_width"
            case title, type, version, width
        }
    }

    func getMetadata(for videoURL: String,
                     success: @escaping (Metadata) -> (),
                     failed: @escaping (Error?) -> ()) {

        let urlMetadata = "https://www.youtube.com/oembed?url=\(videoURL)&format=json"
        guard let url = URL(string: urlMetadata) else { return }

        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let model = try? JSONDecoder().decode(Metadata.self, from: data) {
                    success(model)
                } else {
                    failed(error)
                }
            } else if let error = error {
                failed(error)
            }
        }

        task.resume()

    }
}

let vid = "https://youtu.be/TRqiFPpw2fY"
let req = YTMetadataRequester()
req.getMetadata(for: vid) { metadata in
    print(metadata.title)
} failed: { error in
    print(error.debugDescription)
}

