import Foundation

/// A struct to request YouTube video metadata.
public struct YTMetadataRequester {

    /// A struct representing the metadata of a YouTube video.
    public struct Metadata: Codable {
        /// The name of the author of the video.
        public let authorName: String
        /// The URL of the author's profile.
        public let authorURL: String
        /// The height of the video.
        public let height: Int
        /// The HTML code to embed the video.
        public let html: String
        /// The name of the provider, typically "YouTube".
        public let providerName: String
        /// The URL of the provider.
        public let providerURL: String
        /// The height of the thumbnail image.
        public let thumbnailHeight: Int
        /// The URL of the thumbnail image.
        public let thumbnailURL: String
        /// The width of the thumbnail image.
        public let thumbnailWidth: Int
        /// The title of the video.
        public let title: String
        /// The type of the response, typically "video".
        public let type: String
        /// The version of the oEmbed response format.
        public let version: String
        /// The width of the video.
        public let width: Int

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

        /// Returns a pretty-printed JSON representation of the metadata.
        public func prettyPrinted() -> String? {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            guard let jsonData = try? encoder.encode(self) else {
                return nil
            }
            return String(data: jsonData, encoding: .utf8)
        }
    }

    private var urlSession: URLSession

    /// Initializes a new instance of `YTMetadataRequester`.
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    /// Fetches the metadata for a given YouTube video URL asynchronously.
    ///
    /// - Parameter videoURL: The URL of the YouTube video.
    /// - Returns: The metadata of the YouTube video.
    /// - Throws: An error if the request fails or the data cannot be decoded.
    public func getMetadata(for videoURL: String) async throws -> Metadata {
        // Construct the oEmbed URL with the provided video URL
        let urlMetadata = "https://www.youtube.com/oembed?url=\(videoURL)&format=json"
        guard let url = URL(string: urlMetadata) else {
            throw URLError(.badURL)
        }

        // Create a URL request
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Perform the data task and wait for the result
        let (data, _) = try await urlSession.data(for: request)

        // Decode the data into the Metadata struct
        let metadata = try JSONDecoder().decode(Metadata.self, from: data)

        return metadata
    }
}
