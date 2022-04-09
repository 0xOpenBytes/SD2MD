import XCTest
import ScreenData
import SDMarkdown
import SD2MD

final class SD2MDTests: XCTestCase {
    func testReadme() throws {
        let readme = SomeScreen(
            title: "SD2MD",
            someView: .vstack(
                [
                    .label(title: "Convert ScreenData into basic Markdown", font: .footnote),
                    
                        .spacer(),
                    
                        .label(title: "ScreenData to Markdown (SD2MD)", font: .headline),
                    
                        .text("SD2MD is a Xcode Workspace to convert ScreenData into Markdown and CLI tool to either print or save the Markdown generated from the ScreenData."),
                    
                        .spacer(),
                    
                        .label(title: "Xcode Usage", font: .headline),
                    
                        .text("All changes should be done insider the `Markdown` folder. Edit `Workspace.post` to what you want converted from ScreenData into Markdown."),
                    
                        .spacer(),
                    
                        .code(type: .swift) {
                            """
                            import ScreenData
                            
                            enum Workspace {
                                enum MetadataKey: String {
                                    case date, description, tags
                                }
                                
                                static let post_metadata: [MetadataKey: String]? = [
                                    .date: "2022-02-2 20:22",
                                    .description: "...",
                                    .tags: ""
                                ]
                                
                                static let post = SomeScreen(
                                    title: "[Draft] POST_NAME",
                                    someView: .vstack(
                                        [
                                            .text("TODO")
                                        ]
                                    )
                                )
                            
                            }
                            """
                        },
                    
                        .spacer(),
                    
                    SomeCustomView(markdown: "***").someView,
                    
                        .spacer(),
                    
                        .label(title: "CLI Usage"),
                    
                        .spacer(),
                    
                        .code(type: .text) {
                            """
                            USAGE: sd2-md [<output-path>]
                            
                            ARGUMENTS:
                              <output-path>
                            
                            OPTIONS:
                              -h, --help              Show help information.
                            """
                        }
                ]
            )
        )
        
        print(readme.markdown)
    }
}
