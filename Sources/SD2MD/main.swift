import ScreenData
import ArgumentParser
import FLet
import Foundation
import SDMarkdown

struct SD2MD: ParsableCommand {
    @Argument()
    var outputPath: String?
    
    mutating func run() throws {
        let metadata = Workspace.post_metadata
            .map { (key, value) in
                "\(key.rawValue): \(value)"
            }
            .sorted(by: <)
            .joined(separator: "\n")
        let markdown = Workspace.post.markdown
        
        try output(
            markdown: """
            ---
            \(metadata)
            ---
            \(markdown)
            """
        )
    }
    
    private func output(markdown: String) throws {
        if let outputPath = outputPath {
            let outputURL = URL(fileURLWithPath: outputPath)
            try markdown
                .data(using: .utf8)?
                .write(to: outputURL)
        } else {
            print(markdown)
        }
    }
}

SD2MD.main()

