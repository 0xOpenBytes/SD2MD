//
//  SomeView+Markdown.swift
//  
//
//  Created by Leif on 4/7/22.
//

import ScreenData

enum CodeType: String {
    case swift
    case kotlin
    case shell
    case text = ""
}

extension SomeView {
    static func vstack(_ views: [SomeView]) -> Self {
        SomeContainerView(views: views).someView
    }
    
    static func image(
        url: String,
        width: Int? = nil,
        height: Int? = nil,
        destination: Destination? = nil
    ) -> Self {
        SomeImage(
            url: url,
            width: width,
            height: height,
            destination: destination
        ).someView
    }
    
    static func label(
        title: String,
        subtitle: String? = nil,
        font: FontType = .caption,
        destination: Destination? = nil
    ) -> Self {
        SomeLabel(
            title: title,
            subtitle: subtitle,
            font: font,
            destination: destination
        ).someView
    }
    
    static func text(_ text: String) -> Self {
        SomeText(title: text).someView
    }
    
    static func spacer(size: Int = 1) -> Self {
        SomeSpacer(size: size * 8).someView
    }
    
    static func code(
        type: CodeType,
        _ block: () -> String
    ) -> Self {
        SomeCustomView {
            """
            ```\(type.rawValue)
            \(block())
            ```
            """
        }
        .someView
    }
}
