# youtube-metadata-swift [![Swift](https://github.com/ezefranca/youtube-metadata-swift/actions/workflows/swift.yml/badge.svg)](https://github.com/ezefranca/youtube-metadata-swift/actions/workflows/swift.yml)
> Get YouTube metadata without YouTube API

`youtube-metadata-swift` is a Swift package and command-line tool for fetching metadata of YouTube videos.

## Features

- Fetch metadata for YouTube videos.
- Display the title, author, and thumbnail URL of a video.
- Command-line interface with usage instructions.

## Installation

### Swift Package

To use `youtube-metadata-swift` as a dependency in your Swift project, add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ezefranca/youtube-metadata-swift.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["YTMetadataRequesterLib"]),
]
```

### Command-Line Tool

To install the command-line tool, you can use the provided `install.sh` script:

1. Clone the repository:
    ```bash
    git clone https://github.com/ezefranca/youtube-metadata-swift.git
    cd youtube-metadata-swift
    ```

2. Run the install script:
    ```bash
    ./install.sh
    ```

This will build the tool and copy it to `/usr/local/bin`.

## Usage

### Command-Line Tool

To fetch metadata for a YouTube video, run:

```bash
ytmeta <YouTube URL>
```

## How to get a video metadata from url

```swift

    func getMetadata() async {
        let vid = "https://youtu.be/TRqiFPpw2fY"
        let req = YTMetadataRequester()

        do {
            let metadata = try await req.getMetadata(for: vid)
            print("Title: \(metadata.title)")
        } catch {
            print("Failed to fetch metadata: \(error.localizedDescription)")
        }
    }

```

#### Response

```js
{
  title: 'Foo Fighters - The Sky Is A Neighborhood (Official Music Video)',
  author_name: 'foofightersVEVO',
  author_url: 'https://www.youtube.com/user/foofightersVEVO',
  type: 'video',
  height: 113,
  width: 200,
  version: '1.0',
  provider_name: 'YouTube',
  provider_url: 'https://www.youtube.com/',
  thumbnail_height: 360,
  thumbnail_width: 480,
  thumbnail_url: 'https://i.ytimg.com/vi/TRqiFPpw2fY/hqdefault.jpg',
  html: '<iframe width="200" height="113" src="https://www.youtube.com/embed/TRqiFPpw2fY?feature=oembed" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
}
```

```swift
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
}
```

## Related

A [npm module with the same purpose](https://github.com/ezefranca/youtube-metadata-from-url) 

## License

This project is provided for educational purposes only. It is not affiliated with and has not been approved by Youtube.

