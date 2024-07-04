import XCTest
@testable import YTMetadataRequesterLib

// This is not the best test ever because it will call internet
final class YTMetadataRequesterTests: XCTestCase {
    func testGetMetadata() async {
        let requester = YTMetadataRequester()
        let testURL = "https://youtu.be/TRqiFPpw2fY"

        do {
            let metadata = try await requester.getMetadata(for: testURL)
            XCTAssertEqual(metadata.providerName, "YouTube")
            XCTAssertGreaterThan(metadata.title.count, 0)
            XCTAssertGreaterThan(metadata.authorName.count, 0)
            XCTAssertGreaterThan(metadata.thumbnailURL.count, 0)
        } catch {
            XCTFail("Request failed: \(error.localizedDescription)")
        }
    }
}
