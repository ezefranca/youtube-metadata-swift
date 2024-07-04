import Foundation
import YTMetadataRequesterLib

func printHelp() {
    print("""
    Usage: ytmeta <YouTube URL>

    Fetch and display metadata for a given YouTube URL.

    Options:
    --help        Show this help message.
    """)
}

let arguments = CommandLine.arguments

guard arguments.count > 1 else {
    print("Error: Missing YouTube URL.")
    printHelp()
    exit(1)
}

if arguments.contains("--help") {
    printHelp()
    exit(0)
}

let videoURL = arguments[1]

guard videoURL.hasPrefix("http://") || videoURL.hasPrefix("https://") else {
    print("Error: Invalid URL format. Please provide a valid YouTube URL.")
    exit(1)
}

let requester = YTMetadataRequester()


Task {
    do {
        let metadata = try await requester.getMetadata(for: videoURL)
        if let prettyMetadata = metadata.prettyPrinted() {
            print(prettyMetadata)
        } else {
            print("Failed to pretty print metadata")
        }
    } catch {
        print("Failed to fetch metadata: \(error.localizedDescription)")
    }
}

// Keep the main thread alive to allow asynchronous tasks to complete
RunLoop.main.run()
