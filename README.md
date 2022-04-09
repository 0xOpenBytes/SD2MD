# SD2MD
*Convert ScreenData into basic Markdown*

<br/>

### ScreenData to Markdown (SD2MD)
SD2MD is a Xcode Workspace to convert ScreenData into Markdown and CLI tool to either print or save the Markdown generated from the ScreenData.

<br/>

### Xcode Usage
All changes should be done insider the `Markdown` folder. Edit `Workspace.post` to what you want converted from ScreenData into Markdown.

<br/>

```swift
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
```

<br/>

***

<br/>

**CLI Usage**

<br/>

```
USAGE: sd2-md [<output-path>]

ARGUMENTS:
  <output-path>

OPTIONS:
  -h, --help              Show help information.
```
