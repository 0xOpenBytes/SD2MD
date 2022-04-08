//
//  Workspace.swift
//  
//
//  Created by Leif on 4/7/22.
//

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
