# youtube-metadata-swift
Get YouTube metadata without YouTube API


## How to get a video metadata from url

```swift

let vid = "https://youtu.be/TRqiFPpw2fY"
let req = YTMetadataRequester()
req.getMetadata(for: vid) { metadata in
    print(metadata)
} failed: { error in
    print(error.debugDescription)
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
}
```

## Related

A [npm module with the same purpose](https://github.com/ezefranca/youtube-metadata-from-url) 

## License

This project is provided for educational purposes only. It is not affiliated with and has
not been approved by Youtube.

