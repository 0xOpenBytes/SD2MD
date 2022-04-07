import ScreenData
import ArgumentParser
import FLet
import Foundation

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
        let markdownScreen = SDMarkdown(screen: screen)
        
        if let outputPath = outputPath {
            let outputURL = URL(fileURLWithPath: outputPath)
            try markdownScreen
                .generate()
                .data(using: .utf8)?
                .write(to: outputURL)
        } else {
            print(markdownScreen.generate())
        }
    }
}


SD2MD.main()
