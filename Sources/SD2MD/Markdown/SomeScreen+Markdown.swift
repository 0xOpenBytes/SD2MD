//
//  SomeScreen+Markdown.swift
//  
//
//  Created by Leif on 4/7/22.
//

import ScreenData

extension SomeScreen {
    init(
        title: String,
        headerView: SomeView? = nil,
        someView: SomeView,
        footerView: SomeView? = nil
    ) {
        self.init(
            id: nil,
            title: title,
            backgroundColor: SomeColor(red: 0, green: 0, blue: 0),
            headerView: headerView,
            someView: someView,
            footerView: footerView
        )
    }
}
