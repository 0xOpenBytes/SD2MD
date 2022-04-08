//
//  Destination+Markdown.swift
//  
//
//  Created by Leif on 4/7/22.
//

import ScreenData

extension Destination {
    init(_ path: String) {
        self.init(type: .url, toID: path)
    }
}
