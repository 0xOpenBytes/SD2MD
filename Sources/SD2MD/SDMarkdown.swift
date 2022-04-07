//
//  SDMarkdown.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

struct SDMarkdown {
    let screen: SomeScreen
    
    func generate() -> String {
        var markdown = "# \(screen.title)"
        
        if
            let headerView = screen.headerView,
            let headerMarkdown = headerView.markdown
        { markdown.append("\n" + headerMarkdown) }
        
        if let viewMarkdown = screen.someView.markdown {
            markdown.append("\n" + viewMarkdown)
        }
        
        if
            let footerView = screen.footerView,
            let footerMarkdown = footerView.markdown
        { markdown.append("\n" + footerMarkdown) }
        
        return markdown
    }
}

extension SomeView {
    var markdown: String? {
        if let label = someLabel {
            let labelTitle: () -> String = {
                let title: String
                
                if let destination = label.destination {
                    title = "[\(label.title)](\(destination.toID))"
                } else {
                    title = label.title
                }
                
                switch label.font {
                case .largeTitle: return "# \(title)"
                case .title: return "## \(title)"
                case .headline: return "### \(title)"
                case .body: return title
                case .footnote: return "*\(title)*"
                case .caption: return "**\(title)**"
                }
            }
            let labelSubtitle: () -> String = {
                guard let subtitle = label.subtitle else { return "" }
                switch label.font {
                case .largeTitle: return "\n### \(subtitle)"
                case .title: return "\n#### \(subtitle)"
                case .headline: return "\n##### \(subtitle)"
                case .body: return "\n\(subtitle)"
                case .footnote: return "\n*\(subtitle)*"
                case .caption: return "\n**\(subtitle)**"
                }
            }
            
            return labelTitle() + labelSubtitle()
        } else if let text = someText {
            return text.title
        } else if let spacer = someSpacer {
            if spacer.size > 1 {
                return "\n" + String(repeating: "<br/>", count: spacer.size / 8) + "\n"
            } else {
                return "\n<br/>\n"
            }
        } else if let image = someImage {
            if let destination = image.destination {
                switch destination.type {
                case .screen, .url:
                    return "[![](\(image.url))](\(destination.toID))"
                case .deepLink: break
                }
            }
            
            return "![](\(image.url))"
        } else if let container = someContainer {
            return container.views
                .compactMap(\.markdown)
                .joined(separator: "\n")
        } else {
            return nil
        }
    }
}
