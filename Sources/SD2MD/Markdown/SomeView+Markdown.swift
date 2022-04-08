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
