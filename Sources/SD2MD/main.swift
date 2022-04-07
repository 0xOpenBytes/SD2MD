import ScreenData
import ArgumentParser
import FLet
import Foundation
import SDMarkdown

struct SD2MD: ParsableCommand {
    @Argument()
    var inputPath: String
    
    @Argument()
    var outputPath: String?
    
    mutating func run() throws {
        guard
            let inputFileContents = FileManager.default.contents(atPath: inputPath)
        else { throw __.testing.error(description: "File Not Found: \(inputPath)") }
        
        let screen = try JSONDecoder().decode(SomeScreen.self, from: inputFileContents)
        let markdown = SDMarkdown(
            screen: screen
        )
        
        if let outputPath = outputPath {
            let outputURL = URL(fileURLWithPath: outputPath)
            try markdown
                .screens[0]
                .markdown
                .data(using: .utf8)?
                .write(to: outputURL)
        } else {
            print(
                markdown
                    .screens[0]
                    .markdown
            )
        }
    }
}

SD2MD.main()
